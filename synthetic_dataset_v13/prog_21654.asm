; DESCRIPTION: Renders a orange line between points (321, 194) and (70, 239).
; PLAN: r0=321(x1), r1=194(y1), r2=70(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 194
LDI r2, 70
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
