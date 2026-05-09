; DESCRIPTION: Places a red line segment connecting (483, 28) to (464, 106).
; PLAN: r0=483(x1), r1=28(y1), r2=464(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 28
LDI r2, 464
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
