; DESCRIPTION: Renders a yellow line between points (155, 173) and (238, 196).
; PLAN: r0=155(x1), r1=173(y1), r2=238(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 173
LDI r2, 238
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
