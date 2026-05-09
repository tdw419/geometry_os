; DESCRIPTION: Places a white line segment connecting (35, 74) to (153, 66).
; PLAN: r0=35(x1), r1=74(y1), r2=153(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 74
LDI r2, 153
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
