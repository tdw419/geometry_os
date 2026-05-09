; DESCRIPTION: Renders a blue line between points (102, 177) and (60, 224).
; PLAN: r0=102(x1), r1=177(y1), r2=60(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 177
LDI r2, 60
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
