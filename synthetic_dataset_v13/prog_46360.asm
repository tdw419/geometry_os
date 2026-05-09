; DESCRIPTION: Draws a green line from (328, 188) to (185, 158).
; PLAN: r0=328(x1), r1=188(y1), r2=185(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 188
LDI r2, 185
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
