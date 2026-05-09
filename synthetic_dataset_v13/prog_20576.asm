; DESCRIPTION: Composite: Renders a blue box of size 108x33 starting at (397, 163) then Renders a orange line between points (42, 55) and (333, 124) then Renders a blue disk with center (216, 53) and radius 37.
; PLAN: r0=397(x), r1=163(y), r2=108(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=42(x1), r6=55(y1), r7=333(x2), r8=124(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=216(x), r11=53(y), r12=37(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 397
LDI r1, 163
LDI r2, 108
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 55
LDI r7, 333
LDI r8, 124
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 53
LDI r12, 37
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
