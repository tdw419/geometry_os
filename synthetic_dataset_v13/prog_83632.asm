; DESCRIPTION: Renders a yellow line between points (104, 167) and (226, 48).
; PLAN: r0=104(x1), r1=167(y1), r2=226(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 167
LDI r2, 226
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
