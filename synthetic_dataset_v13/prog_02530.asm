; DESCRIPTION: Places a orange line segment connecting (35, 45) to (458, 69).
; PLAN: r0=35(x1), r1=45(y1), r2=458(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 45
LDI r2, 458
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
