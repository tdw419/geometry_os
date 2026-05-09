; DESCRIPTION: Renders a green line between points (3, 130) and (132, 156).
; PLAN: r0=3(x1), r1=130(y1), r2=132(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 130
LDI r2, 132
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
