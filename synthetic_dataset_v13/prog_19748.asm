; DESCRIPTION: Renders a blue line between points (202, 183) and (453, 255).
; PLAN: r0=202(x1), r1=183(y1), r2=453(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 183
LDI r2, 453
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
