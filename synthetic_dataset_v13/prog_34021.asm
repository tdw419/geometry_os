; DESCRIPTION: Composite: Places a purple dot at position (52, 15) then Renders a orange line between points (374, 203) and (307, 82).
; PLAN: r0=52(x), r1=15(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=374(x1), r6=203(y1), r7=307(x2), r8=82(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 52
LDI r1, 15
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 374
LDI r6, 203
LDI r7, 307
LDI r8, 82
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
