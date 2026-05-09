; DESCRIPTION: Renders a blue line between points (423, 189) and (293, 154).
; PLAN: r0=423(x1), r1=189(y1), r2=293(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 189
LDI r2, 293
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
