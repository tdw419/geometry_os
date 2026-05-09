; DESCRIPTION: Composite: Draws a white rectangle at (107, 89) with width 106 and height 46 then Sets a single purple pixel at (235, 6).
; PLAN: r0=107(x), r1=89(y), r2=106(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x), r6=6(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 107
LDI r1, 89
LDI r2, 106
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 6
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
