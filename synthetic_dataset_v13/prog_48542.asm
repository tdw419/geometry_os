; DESCRIPTION: Renders a blue line between points (426, 165) and (399, 224).
; PLAN: r0=426(x1), r1=165(y1), r2=399(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 165
LDI r2, 399
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
