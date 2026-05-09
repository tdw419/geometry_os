; DESCRIPTION: Renders a blue line between points (116, 54) and (182, 48).
; PLAN: r0=116(x1), r1=54(y1), r2=182(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 54
LDI r2, 182
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
