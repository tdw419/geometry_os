; DESCRIPTION: Places a orange line segment connecting (111, 59) to (121, 244).
; PLAN: r0=111(x1), r1=59(y1), r2=121(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 59
LDI r2, 121
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
