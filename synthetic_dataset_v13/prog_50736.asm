; DESCRIPTION: Places a red line segment connecting (260, 26) to (125, 93).
; PLAN: r0=260(x1), r1=26(y1), r2=125(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 26
LDI r2, 125
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
