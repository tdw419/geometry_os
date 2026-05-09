; DESCRIPTION: Composite: Renders a black box of size 11x107 starting at (147, 106) then Renders a purple line between points (81, 178) and (432, 138) then Places a cyan dot at position (340, 46).
; PLAN: r0=147(x), r1=106(y), r2=11(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x1), r6=178(y1), r7=432(x2), r8=138(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=340(x), r11=46(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 147
LDI r1, 106
LDI r2, 11
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 178
LDI r7, 432
LDI r8, 138
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 46
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
