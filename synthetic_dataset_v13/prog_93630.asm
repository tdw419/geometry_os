; DESCRIPTION: Renders a green line between points (69, 237) and (420, 119).
; PLAN: r0=69(x1), r1=237(y1), r2=420(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 237
LDI r2, 420
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
