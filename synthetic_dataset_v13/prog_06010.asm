; DESCRIPTION: Places a red line segment connecting (74, 199) to (81, 123).
; PLAN: r0=74(x1), r1=199(y1), r2=81(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 199
LDI r2, 81
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
