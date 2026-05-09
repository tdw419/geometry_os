; DESCRIPTION: Places a red line segment connecting (193, 40) to (156, 160).
; PLAN: r0=193(x1), r1=40(y1), r2=156(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 40
LDI r2, 156
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
