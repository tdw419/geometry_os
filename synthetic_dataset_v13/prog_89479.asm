; DESCRIPTION: Composite: Places a purple 38x59 rectangle at position (303, 165) then Renders a magenta disk with center (63, 65) and radius 20 then Places a black line segment connecting (265, 106) to (299, 157).
; PLAN: r0=303(x), r1=165(y), r2=38(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x), r6=65(y), r7=20(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=265(x1), r11=106(y1), r12=299(x2), r13=157(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 165
LDI r2, 38
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 65
LDI r7, 20
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 265
LDI r11, 106
LDI r12, 299
LDI r13, 157
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
