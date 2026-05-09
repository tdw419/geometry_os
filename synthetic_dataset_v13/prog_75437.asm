; DESCRIPTION: Renders a blue line between points (398, 252) and (26, 69).
; PLAN: r0=398(x1), r1=252(y1), r2=26(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 252
LDI r2, 26
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
