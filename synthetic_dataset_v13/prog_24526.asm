; DESCRIPTION: Renders a blue line between points (274, 36) and (54, 27).
; PLAN: r0=274(x1), r1=36(y1), r2=54(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 36
LDI r2, 54
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
