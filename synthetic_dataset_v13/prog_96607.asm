; DESCRIPTION: Renders a yellow line between points (425, 196) and (208, 136).
; PLAN: r0=425(x1), r1=196(y1), r2=208(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 196
LDI r2, 208
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
