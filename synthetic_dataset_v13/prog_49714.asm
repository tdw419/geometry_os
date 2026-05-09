; DESCRIPTION: Places a orange line segment connecting (362, 189) to (349, 176).
; PLAN: r0=362(x1), r1=189(y1), r2=349(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 189
LDI r2, 349
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
