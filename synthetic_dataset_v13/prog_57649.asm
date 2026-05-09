; DESCRIPTION: Draws a green line from (417, 167) to (377, 140).
; PLAN: r0=417(x1), r1=167(y1), r2=377(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 167
LDI r2, 377
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
