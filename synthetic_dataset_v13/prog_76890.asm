; DESCRIPTION: Places a orange line segment connecting (256, 19) to (324, 166).
; PLAN: r0=256(x1), r1=19(y1), r2=324(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 19
LDI r2, 324
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
