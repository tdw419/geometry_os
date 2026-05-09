; DESCRIPTION: Composite: Creates a black circular shape at (228, 94) with radius 41 then Places a cyan line segment connecting (29, 207) to (317, 84) then Sets a single blue pixel at (66, 126).
; PLAN: r0=228(x), r1=94(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x1), r6=207(y1), r7=317(x2), r8=84(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=66(x), r11=126(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 228
LDI r1, 94
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 207
LDI r7, 317
LDI r8, 84
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 66
LDI r11, 126
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
