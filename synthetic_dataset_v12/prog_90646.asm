; DESCRIPTION: Renders a green line between points (64, 169) and (69, 237).
; PLAN: r0=64(x1), r1=169(y1), r2=69(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 169
LDI r2, 69
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
