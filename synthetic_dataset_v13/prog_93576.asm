; DESCRIPTION: Renders a blue line between points (33, 11) and (447, 195).
; PLAN: r0=33(x1), r1=11(y1), r2=447(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 11
LDI r2, 447
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
