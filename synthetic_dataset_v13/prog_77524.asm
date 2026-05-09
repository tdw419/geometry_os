; DESCRIPTION: Renders a green line between points (0, 198) and (63, 144).
; PLAN: r0=0(x1), r1=198(y1), r2=63(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 198
LDI r2, 63
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
