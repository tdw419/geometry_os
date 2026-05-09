; DESCRIPTION: Renders a orange line between points (17, 92) and (305, 1).
; PLAN: r0=17(x1), r1=92(y1), r2=305(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 92
LDI r2, 305
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
