; DESCRIPTION: Places a orange line segment connecting (359, 27) to (208, 221).
; PLAN: r0=359(x1), r1=27(y1), r2=208(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 27
LDI r2, 208
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
