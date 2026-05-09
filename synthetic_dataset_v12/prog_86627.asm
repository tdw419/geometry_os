; DESCRIPTION: Places a blue line segment connecting (352, 74) to (252, 121).
; PLAN: r0=352(x1), r1=74(y1), r2=252(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 74
LDI r2, 252
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
