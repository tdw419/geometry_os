; DESCRIPTION: Renders a blue line between points (415, 136) and (182, 57).
; PLAN: r0=415(x1), r1=136(y1), r2=182(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 136
LDI r2, 182
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
