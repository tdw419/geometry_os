; DESCRIPTION: Renders a orange line between points (38, 55) and (398, 99).
; PLAN: r0=38(x1), r1=55(y1), r2=398(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 55
LDI r2, 398
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
