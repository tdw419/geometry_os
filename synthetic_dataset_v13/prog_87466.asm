; DESCRIPTION: Places a orange line segment connecting (487, 18) to (160, 216).
; PLAN: r0=487(x1), r1=18(y1), r2=160(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 18
LDI r2, 160
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
