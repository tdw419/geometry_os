; DESCRIPTION: Composite: Renders a blue line between points (237, 209) and (267, 153) then Renders a purple disk with center (207, 171) and radius 38 then Creates a blue rectangular region at (77, 147) spanning 113 by 61 pixels.
; PLAN: r0=237(x1), r1=209(y1), r2=267(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=171(y), r7=38(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=77(x), r11=147(y), r12=113(width), r13=61(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 209
LDI r2, 267
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 171
LDI r7, 38
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 77
LDI r11, 147
LDI r12, 113
LDI r13, 61
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
