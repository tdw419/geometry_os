; DESCRIPTION: Draws a purple line from (301, 54) to (83, 126).
; PLAN: r0=301(x1), r1=54(y1), r2=83(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 54
LDI r2, 83
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
