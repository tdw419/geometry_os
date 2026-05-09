; DESCRIPTION: Composite: Renders a yellow box of size 49x45 starting at (20, 63) then Creates a blue circular shape at (167, 75) with radius 33 then Draws a white line from (149, 172) to (243, 200).
; PLAN: r0=20(x), r1=63(y), r2=49(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=167(x), r6=75(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=149(x1), r11=172(y1), r12=243(x2), r13=200(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 63
LDI r2, 49
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 75
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 149
LDI r11, 172
LDI r12, 243
LDI r13, 200
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
