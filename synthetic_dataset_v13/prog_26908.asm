; DESCRIPTION: Renders a blue line between points (211, 160) and (294, 0).
; PLAN: r0=211(x1), r1=160(y1), r2=294(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 160
LDI r2, 294
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
