; DESCRIPTION: Renders a green line between points (412, 99) and (453, 4).
; PLAN: r0=412(x1), r1=99(y1), r2=453(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 99
LDI r2, 453
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
