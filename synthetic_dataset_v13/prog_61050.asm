; DESCRIPTION: Renders a blue line between points (256, 81) and (475, 199).
; PLAN: r0=256(x1), r1=81(y1), r2=475(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 81
LDI r2, 475
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
