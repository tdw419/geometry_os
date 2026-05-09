; DESCRIPTION: Renders a blue line between points (356, 214) and (309, 55).
; PLAN: r0=356(x1), r1=214(y1), r2=309(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 214
LDI r2, 309
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
