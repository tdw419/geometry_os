; DESCRIPTION: Renders a orange line between points (242, 120) and (347, 123).
; PLAN: r0=242(x1), r1=120(y1), r2=347(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 120
LDI r2, 347
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
