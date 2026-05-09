; DESCRIPTION: Places a blue line segment connecting (292, 223) to (426, 233).
; PLAN: r0=292(x1), r1=223(y1), r2=426(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 223
LDI r2, 426
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
