; DESCRIPTION: Renders a blue line between points (76, 134) and (202, 184).
; PLAN: r0=76(x1), r1=134(y1), r2=202(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 134
LDI r2, 202
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
