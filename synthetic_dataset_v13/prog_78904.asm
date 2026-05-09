; DESCRIPTION: Renders a blue line between points (182, 129) and (47, 199).
; PLAN: r0=182(x1), r1=129(y1), r2=47(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 129
LDI r2, 47
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
