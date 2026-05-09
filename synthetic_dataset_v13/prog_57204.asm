; DESCRIPTION: Renders a blue line between points (242, 200) and (494, 103).
; PLAN: r0=242(x1), r1=200(y1), r2=494(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 200
LDI r2, 494
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
