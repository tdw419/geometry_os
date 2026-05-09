; DESCRIPTION: Renders a orange line between points (45, 232) and (356, 113).
; PLAN: r0=45(x1), r1=232(y1), r2=356(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 232
LDI r2, 356
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
