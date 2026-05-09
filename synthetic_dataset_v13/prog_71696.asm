; DESCRIPTION: Renders a magenta line between points (366, 184) and (321, 239).
; PLAN: r0=366(x1), r1=184(y1), r2=321(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 184
LDI r2, 321
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
