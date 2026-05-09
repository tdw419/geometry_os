; DESCRIPTION: Renders a orange line between points (63, 29) and (277, 239).
; PLAN: r0=63(x1), r1=29(y1), r2=277(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 29
LDI r2, 277
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
