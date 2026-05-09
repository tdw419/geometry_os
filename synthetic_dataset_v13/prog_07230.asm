; DESCRIPTION: Composite: Places a yellow line segment connecting (126, 216) to (479, 35) then Places a white 114x98 rectangle at position (204, 148) then Places a orange dot at position (147, 43).
; PLAN: r0=126(x1), r1=216(y1), r2=479(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=148(y), r7=114(width), r8=98(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=147(x), r11=43(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 126
LDI r1, 216
LDI r2, 479
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 148
LDI r7, 114
LDI r8, 98
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 43
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
