; DESCRIPTION: Places a red line segment connecting (269, 108) to (270, 23).
; PLAN: r0=269(x1), r1=108(y1), r2=270(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 108
LDI r2, 270
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
