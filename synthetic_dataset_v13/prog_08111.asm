; DESCRIPTION: Renders a blue line between points (384, 80) and (286, 12).
; PLAN: r0=384(x1), r1=80(y1), r2=286(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 80
LDI r2, 286
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
