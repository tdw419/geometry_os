; DESCRIPTION: Renders a green line between points (384, 58) and (136, 133).
; PLAN: r0=384(x1), r1=58(y1), r2=136(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 58
LDI r2, 136
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
