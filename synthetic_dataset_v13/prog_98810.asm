; DESCRIPTION: Renders a blue line between points (217, 232) and (154, 76).
; PLAN: r0=217(x1), r1=232(y1), r2=154(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 232
LDI r2, 154
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
