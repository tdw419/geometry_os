; DESCRIPTION: Draws a blue line from (83, 158) to (352, 44).
; PLAN: r0=83(x1), r1=158(y1), r2=352(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 158
LDI r2, 352
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
