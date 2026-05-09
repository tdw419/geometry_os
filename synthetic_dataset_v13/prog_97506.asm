; DESCRIPTION: Composite: Places a black line segment connecting (270, 115) to (89, 29) then Places a orange 11x93 rectangle at position (287, 70) then Places a blue dot at position (69, 5).
; PLAN: r0=270(x1), r1=115(y1), r2=89(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=70(y), r7=11(width), r8=93(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=69(x), r11=5(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 270
LDI r1, 115
LDI r2, 89
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 70
LDI r7, 11
LDI r8, 93
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 5
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
