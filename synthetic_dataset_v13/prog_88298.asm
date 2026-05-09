; DESCRIPTION: Draws a purple line from (128, 131) to (510, 251).
; PLAN: r0=128(x1), r1=131(y1), r2=510(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 131
LDI r2, 510
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
