; DESCRIPTION: Renders a blue line between points (278, 117) and (494, 250).
; PLAN: r0=278(x1), r1=117(y1), r2=494(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 117
LDI r2, 494
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
