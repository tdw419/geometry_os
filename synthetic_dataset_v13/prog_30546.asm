; DESCRIPTION: Renders a blue line between points (294, 149) and (88, 135).
; PLAN: r0=294(x1), r1=149(y1), r2=88(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 149
LDI r2, 88
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
