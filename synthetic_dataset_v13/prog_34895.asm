; DESCRIPTION: Renders a orange line between points (40, 13) and (385, 210).
; PLAN: r0=40(x1), r1=13(y1), r2=385(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 13
LDI r2, 385
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
