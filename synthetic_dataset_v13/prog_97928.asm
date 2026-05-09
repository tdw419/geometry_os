; DESCRIPTION: Places a red line segment connecting (68, 80) to (336, 125).
; PLAN: r0=68(x1), r1=80(y1), r2=336(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 80
LDI r2, 336
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
