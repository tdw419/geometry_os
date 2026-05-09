; DESCRIPTION: Draws a black line from (183, 87) to (374, 203).
; PLAN: r0=183(x1), r1=87(y1), r2=374(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 87
LDI r2, 374
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
