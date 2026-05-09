; DESCRIPTION: Renders a blue line between points (74, 73) and (96, 224).
; PLAN: r0=74(x1), r1=73(y1), r2=96(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 73
LDI r2, 96
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
