; DESCRIPTION: Renders a blue line between points (329, 190) and (148, 209).
; PLAN: r0=329(x1), r1=190(y1), r2=148(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 190
LDI r2, 148
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
