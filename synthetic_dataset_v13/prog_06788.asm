; DESCRIPTION: Composite: Sets a single cyan pixel at (105, 125) then Places a magenta 14x71 rectangle at position (122, 117) then Places a black line segment connecting (375, 158) to (134, 137).
; PLAN: r0=105(x), r1=125(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=122(x), r6=117(y), r7=14(width), r8=71(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=375(x1), r11=158(y1), r12=134(x2), r13=137(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 125
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 122
LDI r6, 117
LDI r7, 14
LDI r8, 71
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 158
LDI r12, 134
LDI r13, 137
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
