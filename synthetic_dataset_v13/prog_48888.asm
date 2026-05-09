; DESCRIPTION: Draws a purple line from (156, 69) to (218, 60).
; PLAN: r0=156(x1), r1=69(y1), r2=218(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 69
LDI r2, 218
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
