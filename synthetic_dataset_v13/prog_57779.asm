; DESCRIPTION: Places a red line segment connecting (76, 152) to (159, 120).
; PLAN: r0=76(x1), r1=152(y1), r2=159(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 152
LDI r2, 159
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
