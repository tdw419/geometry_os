; DESCRIPTION: Renders a orange line between points (385, 212) and (412, 48).
; PLAN: r0=385(x1), r1=212(y1), r2=412(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 212
LDI r2, 412
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
