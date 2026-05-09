; DESCRIPTION: Draws a green line from (509, 97) to (140, 233).
; PLAN: r0=509(x1), r1=97(y1), r2=140(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 97
LDI r2, 140
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
