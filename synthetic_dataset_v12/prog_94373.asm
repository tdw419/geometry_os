; DESCRIPTION: Places a red line segment connecting (370, 149) to (212, 82).
; PLAN: r0=370(x1), r1=149(y1), r2=212(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 149
LDI r2, 212
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
