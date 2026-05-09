; DESCRIPTION: Places a white line segment connecting (292, 160) to (79, 141).
; PLAN: r0=292(x1), r1=160(y1), r2=79(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 160
LDI r2, 79
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
