; DESCRIPTION: Draws a black line from (363, 97) to (374, 185).
; PLAN: r0=363(x1), r1=97(y1), r2=374(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 97
LDI r2, 374
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
