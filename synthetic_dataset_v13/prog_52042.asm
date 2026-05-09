; DESCRIPTION: Renders a orange line between points (87, 235) and (459, 156).
; PLAN: r0=87(x1), r1=235(y1), r2=459(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 235
LDI r2, 459
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
