; DESCRIPTION: Places a orange line segment connecting (492, 46) to (187, 14).
; PLAN: r0=492(x1), r1=46(y1), r2=187(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 46
LDI r2, 187
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
