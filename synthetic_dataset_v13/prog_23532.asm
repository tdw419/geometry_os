; DESCRIPTION: Renders a green line between points (72, 250) and (160, 237).
; PLAN: r0=72(x1), r1=250(y1), r2=160(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 250
LDI r2, 160
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
