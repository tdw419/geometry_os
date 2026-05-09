; DESCRIPTION: Composite: Creates a black circular shape at (228, 203) with radius 42 then Places a orange line segment connecting (366, 211) to (468, 93) then Places a green dot at position (180, 236).
; PLAN: r0=228(x), r1=203(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=366(x1), r6=211(y1), r7=468(x2), r8=93(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=180(x), r11=236(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 228
LDI r1, 203
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 366
LDI r6, 211
LDI r7, 468
LDI r8, 93
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 236
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
