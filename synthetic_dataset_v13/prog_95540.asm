; DESCRIPTION: Renders a blue line between points (182, 210) and (304, 140).
; PLAN: r0=182(x1), r1=210(y1), r2=304(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 210
LDI r2, 304
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
