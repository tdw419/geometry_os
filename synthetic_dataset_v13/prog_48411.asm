; DESCRIPTION: Draws a purple line from (365, 151) to (406, 119).
; PLAN: r0=365(x1), r1=151(y1), r2=406(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 151
LDI r2, 406
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
