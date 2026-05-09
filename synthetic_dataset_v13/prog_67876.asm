; DESCRIPTION: Places a red line segment connecting (336, 71) to (462, 76).
; PLAN: r0=336(x1), r1=71(y1), r2=462(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 71
LDI r2, 462
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
