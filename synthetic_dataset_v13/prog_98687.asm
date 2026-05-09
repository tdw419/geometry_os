; DESCRIPTION: Renders a yellow line between points (69, 236) and (481, 119).
; PLAN: r0=69(x1), r1=236(y1), r2=481(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 236
LDI r2, 481
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
