; DESCRIPTION: Renders a green line between points (477, 69) and (462, 209).
; PLAN: r0=477(x1), r1=69(y1), r2=462(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 69
LDI r2, 462
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
