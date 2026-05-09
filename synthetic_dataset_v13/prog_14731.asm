; DESCRIPTION: Places a orange line segment connecting (22, 239) to (82, 72).
; PLAN: r0=22(x1), r1=239(y1), r2=82(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 239
LDI r2, 82
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
