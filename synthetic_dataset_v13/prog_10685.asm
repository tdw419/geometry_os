; DESCRIPTION: Places a orange line segment connecting (349, 4) to (294, 208).
; PLAN: r0=349(x1), r1=4(y1), r2=294(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 4
LDI r2, 294
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
