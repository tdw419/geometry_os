; DESCRIPTION: Places a red line segment connecting (149, 229) to (397, 71).
; PLAN: r0=149(x1), r1=229(y1), r2=397(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 229
LDI r2, 397
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
