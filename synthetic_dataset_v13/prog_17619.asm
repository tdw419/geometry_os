; DESCRIPTION: Renders a blue line between points (11, 60) and (167, 43).
; PLAN: r0=11(x1), r1=60(y1), r2=167(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 60
LDI r2, 167
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
