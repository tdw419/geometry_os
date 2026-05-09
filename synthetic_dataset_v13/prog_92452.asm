; DESCRIPTION: Renders a yellow line between points (93, 65) and (384, 223).
; PLAN: r0=93(x1), r1=65(y1), r2=384(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 65
LDI r2, 384
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
