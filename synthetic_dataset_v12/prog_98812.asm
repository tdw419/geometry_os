; DESCRIPTION: Draws a purple line from (272, 13) to (417, 30).
; PLAN: r0=272(x1), r1=13(y1), r2=417(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 13
LDI r2, 417
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
