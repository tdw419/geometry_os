; DESCRIPTION: Places a red line segment connecting (90, 163) to (345, 3).
; PLAN: r0=90(x1), r1=163(y1), r2=345(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 163
LDI r2, 345
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
