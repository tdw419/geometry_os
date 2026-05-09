; DESCRIPTION: Places a red line segment connecting (89, 32) to (95, 4).
; PLAN: r0=89(x1), r1=32(y1), r2=95(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 32
LDI r2, 95
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
