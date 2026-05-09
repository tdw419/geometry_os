; DESCRIPTION: Renders a blue line between points (20, 64) and (384, 253).
; PLAN: r0=20(x1), r1=64(y1), r2=384(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 64
LDI r2, 384
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
