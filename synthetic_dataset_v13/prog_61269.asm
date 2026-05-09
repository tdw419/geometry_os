; DESCRIPTION: Places a orange line segment connecting (196, 195) to (483, 246).
; PLAN: r0=196(x1), r1=195(y1), r2=483(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 195
LDI r2, 483
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
