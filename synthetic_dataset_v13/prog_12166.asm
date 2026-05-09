; DESCRIPTION: Renders a yellow line between points (453, 64) and (168, 227).
; PLAN: r0=453(x1), r1=64(y1), r2=168(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 64
LDI r2, 168
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
