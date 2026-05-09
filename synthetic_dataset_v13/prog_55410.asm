; DESCRIPTION: Places a red line segment connecting (287, 226) to (106, 249).
; PLAN: r0=287(x1), r1=226(y1), r2=106(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 226
LDI r2, 106
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
