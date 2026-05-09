; DESCRIPTION: Renders a blue line between points (291, 73) and (278, 26).
; PLAN: r0=291(x1), r1=73(y1), r2=278(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 73
LDI r2, 278
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
