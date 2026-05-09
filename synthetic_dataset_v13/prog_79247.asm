; DESCRIPTION: Places a orange line segment connecting (399, 195) to (230, 167).
; PLAN: r0=399(x1), r1=195(y1), r2=230(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 195
LDI r2, 230
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
