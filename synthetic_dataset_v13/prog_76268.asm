; DESCRIPTION: Composite: Renders a blue line between points (19, 119) and (264, 82) then Creates a blue circular shape at (229, 87) with radius 41 then Creates a magenta rectangular region at (202, 151) spanning 45 by 79 pixels.
; PLAN: r0=19(x1), r1=119(y1), r2=264(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=87(y), r7=41(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=202(x), r11=151(y), r12=45(width), r13=79(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 19
LDI r1, 119
LDI r2, 264
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 87
LDI r7, 41
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 202
LDI r11, 151
LDI r12, 45
LDI r13, 79
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
