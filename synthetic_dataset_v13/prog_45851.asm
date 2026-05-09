; DESCRIPTION: Places a red line segment connecting (232, 166) to (208, 24).
; PLAN: r0=232(x1), r1=166(y1), r2=208(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 166
LDI r2, 208
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
