; DESCRIPTION: Renders a blue line between points (69, 184) and (48, 151).
; PLAN: r0=69(x1), r1=184(y1), r2=48(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 184
LDI r2, 48
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
