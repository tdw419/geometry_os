; DESCRIPTION: Draws a purple line from (463, 237) to (365, 12).
; PLAN: r0=463(x1), r1=237(y1), r2=365(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 237
LDI r2, 365
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
