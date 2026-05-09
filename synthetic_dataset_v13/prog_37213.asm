; DESCRIPTION: Places a red line segment connecting (44, 164) to (311, 20).
; PLAN: r0=44(x1), r1=164(y1), r2=311(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 164
LDI r2, 311
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
