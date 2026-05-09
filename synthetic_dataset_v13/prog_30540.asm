; DESCRIPTION: Draws a magenta line from (297, 140) to (62, 60).
; PLAN: r0=297(x1), r1=140(y1), r2=62(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 140
LDI r2, 62
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
