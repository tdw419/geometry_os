; DESCRIPTION: Composite: Renders a orange line between points (197, 2) and (132, 235) then Places a red 51x95 rectangle at position (367, 66) then Places a magenta dot at position (212, 77).
; PLAN: r0=197(x1), r1=2(y1), r2=132(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=66(y), r7=51(width), r8=95(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=212(x), r11=77(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 197
LDI r1, 2
LDI r2, 132
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 66
LDI r7, 51
LDI r8, 95
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 77
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
