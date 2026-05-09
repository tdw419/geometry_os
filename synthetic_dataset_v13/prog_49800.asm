; DESCRIPTION: Places a red line segment connecting (98, 10) to (363, 134).
; PLAN: r0=98(x1), r1=10(y1), r2=363(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 10
LDI r2, 363
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
