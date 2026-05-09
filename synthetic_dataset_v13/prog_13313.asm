; DESCRIPTION: Places a red line segment connecting (138, 188) to (61, 141).
; PLAN: r0=138(x1), r1=188(y1), r2=61(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 188
LDI r2, 61
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
