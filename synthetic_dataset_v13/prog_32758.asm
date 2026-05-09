; DESCRIPTION: Renders a green line between points (384, 40) and (296, 181).
; PLAN: r0=384(x1), r1=40(y1), r2=296(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 40
LDI r2, 296
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
