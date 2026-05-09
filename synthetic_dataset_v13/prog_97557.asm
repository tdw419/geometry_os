; DESCRIPTION: Places a red line segment connecting (488, 137) to (396, 80).
; PLAN: r0=488(x1), r1=137(y1), r2=396(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 137
LDI r2, 396
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
