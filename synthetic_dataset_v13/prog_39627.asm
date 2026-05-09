; DESCRIPTION: Renders a orange line between points (50, 56) and (277, 5).
; PLAN: r0=50(x1), r1=56(y1), r2=277(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 56
LDI r2, 277
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
