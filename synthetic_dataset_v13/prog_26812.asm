; DESCRIPTION: Places a orange line segment connecting (481, 160) to (98, 164).
; PLAN: r0=481(x1), r1=160(y1), r2=98(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 160
LDI r2, 98
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
