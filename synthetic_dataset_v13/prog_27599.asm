; DESCRIPTION: Composite: Renders a red disk with center (434, 115) and radius 38 then Places a yellow line segment connecting (223, 13) to (20, 140) then Creates a blue rectangular region at (194, 168) spanning 29 by 18 pixels.
; PLAN: r0=434(x), r1=115(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x1), r6=13(y1), r7=20(x2), r8=140(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=194(x), r11=168(y), r12=29(width), r13=18(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 115
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 13
LDI r7, 20
LDI r8, 140
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 168
LDI r12, 29
LDI r13, 18
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
