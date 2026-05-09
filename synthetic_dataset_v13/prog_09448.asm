; DESCRIPTION: Draws a orange line from (398, 35) to (91, 133).
; PLAN: r0=398(x1), r1=35(y1), r2=91(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 35
LDI r2, 91
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
