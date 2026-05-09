; DESCRIPTION: Places a red line segment connecting (494, 22) to (188, 173).
; PLAN: r0=494(x1), r1=22(y1), r2=188(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 22
LDI r2, 188
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
