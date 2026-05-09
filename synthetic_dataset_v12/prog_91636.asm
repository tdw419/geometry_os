; DESCRIPTION: Renders a blue line between points (167, 29) and (52, 47).
; PLAN: r0=167(x1), r1=29(y1), r2=52(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 29
LDI r2, 52
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
