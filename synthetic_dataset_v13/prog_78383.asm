; DESCRIPTION: Renders a black line between points (406, 13) and (132, 144).
; PLAN: r0=406(x1), r1=13(y1), r2=132(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 13
LDI r2, 132
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
