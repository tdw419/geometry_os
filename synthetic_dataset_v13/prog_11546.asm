; DESCRIPTION: Renders a white line between points (33, 193) and (63, 145).
; PLAN: r0=33(x1), r1=193(y1), r2=63(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 193
LDI r2, 63
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
