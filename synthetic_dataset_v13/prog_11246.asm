; DESCRIPTION: Renders a blue line between points (14, 28) and (48, 65).
; PLAN: r0=14(x1), r1=28(y1), r2=48(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 28
LDI r2, 48
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
