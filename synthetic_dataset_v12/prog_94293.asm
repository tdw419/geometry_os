; DESCRIPTION: Places a red line segment connecting (358, 232) to (295, 137).
; PLAN: r0=358(x1), r1=232(y1), r2=295(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 232
LDI r2, 295
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
