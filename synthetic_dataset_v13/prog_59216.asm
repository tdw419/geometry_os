; DESCRIPTION: Places a red line segment connecting (245, 212) to (359, 166).
; PLAN: r0=245(x1), r1=212(y1), r2=359(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 212
LDI r2, 359
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
