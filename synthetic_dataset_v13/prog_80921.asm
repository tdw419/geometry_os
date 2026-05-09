; DESCRIPTION: Places a red line segment connecting (172, 168) to (380, 119).
; PLAN: r0=172(x1), r1=168(y1), r2=380(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 168
LDI r2, 380
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
