; DESCRIPTION: Renders a orange line between points (432, 16) and (350, 225).
; PLAN: r0=432(x1), r1=16(y1), r2=350(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 16
LDI r2, 350
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
