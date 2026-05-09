; DESCRIPTION: Composite: Renders a green box of size 72x21 starting at (220, 225) then Places a orange line segment connecting (235, 72) to (158, 190) then Sets a single magenta pixel at (118, 52).
; PLAN: r0=220(x), r1=225(y), r2=72(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x1), r6=72(y1), r7=158(x2), r8=190(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=118(x), r11=52(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 220
LDI r1, 225
LDI r2, 72
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 72
LDI r7, 158
LDI r8, 190
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 118
LDI r11, 52
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
