; DESCRIPTION: Composite: Draws a purple line from (426, 195) to (407, 212) then Renders a green box of size 109x26 starting at (83, 44) then Sets a single red pixel at (348, 12).
; PLAN: r0=426(x1), r1=195(y1), r2=407(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=44(y), r7=109(width), r8=26(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=348(x), r11=12(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 426
LDI r1, 195
LDI r2, 407
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 44
LDI r7, 109
LDI r8, 26
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 348
LDI r11, 12
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
