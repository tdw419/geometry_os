; DESCRIPTION: Draws a blue line from (323, 69) to (406, 168).
; PLAN: r0=323(x1), r1=69(y1), r2=406(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 69
LDI r2, 406
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
