; DESCRIPTION: Renders a yellow line between points (145, 15) and (419, 103).
; PLAN: r0=145(x1), r1=15(y1), r2=419(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 15
LDI r2, 419
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
