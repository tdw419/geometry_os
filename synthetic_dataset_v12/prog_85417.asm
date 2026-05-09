; DESCRIPTION: Places a orange line segment connecting (59, 48) to (43, 167).
; PLAN: r0=59(x1), r1=48(y1), r2=43(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 48
LDI r2, 43
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
