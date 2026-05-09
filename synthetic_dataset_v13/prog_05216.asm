; DESCRIPTION: Renders a yellow line between points (494, 50) and (350, 237).
; PLAN: r0=494(x1), r1=50(y1), r2=350(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 50
LDI r2, 350
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
