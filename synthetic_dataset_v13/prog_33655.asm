; DESCRIPTION: Composite: Renders a purple box of size 21x41 starting at (156, 195) then Renders a yellow line between points (54, 43) and (257, 1) then Places a white dot at position (22, 250).
; PLAN: r0=156(x), r1=195(y), r2=21(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=54(x1), r6=43(y1), r7=257(x2), r8=1(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=22(x), r11=250(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 195
LDI r2, 21
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 43
LDI r7, 257
LDI r8, 1
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 22
LDI r11, 250
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
