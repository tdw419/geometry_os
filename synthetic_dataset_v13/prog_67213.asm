; DESCRIPTION: Composite: Places a orange 84x18 rectangle at position (112, 163) then Places a magenta line segment connecting (321, 30) to (400, 64) then Places a green circle of radius 69 at center (243, 119).
; PLAN: r0=112(x), r1=163(y), r2=84(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x1), r6=30(y1), r7=400(x2), r8=64(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=243(x), r11=119(y), r12=69(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 112
LDI r1, 163
LDI r2, 84
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 30
LDI r7, 400
LDI r8, 64
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 119
LDI r12, 69
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
