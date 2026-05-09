; DESCRIPTION: Renders a orange line between points (46, 80) and (350, 33).
; PLAN: r0=46(x1), r1=80(y1), r2=350(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 80
LDI r2, 350
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
