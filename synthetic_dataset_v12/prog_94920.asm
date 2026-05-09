; DESCRIPTION: Draws a green line from (506, 130) to (227, 169).
; PLAN: r0=506(x1), r1=130(y1), r2=227(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 130
LDI r2, 227
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
