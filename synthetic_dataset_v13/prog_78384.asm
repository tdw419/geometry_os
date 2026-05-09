; DESCRIPTION: Places a orange line segment connecting (410, 69) to (138, 144).
; PLAN: r0=410(x1), r1=69(y1), r2=138(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 69
LDI r2, 138
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
