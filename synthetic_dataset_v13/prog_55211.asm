; DESCRIPTION: Places a red line segment connecting (14, 149) to (408, 4).
; PLAN: r0=14(x1), r1=149(y1), r2=408(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 149
LDI r2, 408
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
