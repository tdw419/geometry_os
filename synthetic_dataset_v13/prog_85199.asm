; DESCRIPTION: Places a orange line segment connecting (1, 214) to (215, 87).
; PLAN: r0=1(x1), r1=214(y1), r2=215(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 214
LDI r2, 215
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
