; DESCRIPTION: Places a orange line segment connecting (313, 106) to (17, 146).
; PLAN: r0=313(x1), r1=106(y1), r2=17(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 106
LDI r2, 17
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
