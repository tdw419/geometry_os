; DESCRIPTION: Draws a white line from (307, 170) to (323, 226).
; PLAN: r0=307(x1), r1=170(y1), r2=323(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 170
LDI r2, 323
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
