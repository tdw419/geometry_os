; DESCRIPTION: Renders a orange line between points (319, 222) and (33, 33).
; PLAN: r0=319(x1), r1=222(y1), r2=33(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 222
LDI r2, 33
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
