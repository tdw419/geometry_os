; DESCRIPTION: Renders a yellow line between points (114, 226) and (384, 119).
; PLAN: r0=114(x1), r1=226(y1), r2=384(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 226
LDI r2, 384
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
