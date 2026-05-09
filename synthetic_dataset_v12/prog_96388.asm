; DESCRIPTION: Renders a blue line between points (394, 20) and (310, 53).
; PLAN: r0=394(x1), r1=20(y1), r2=310(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 20
LDI r2, 310
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
