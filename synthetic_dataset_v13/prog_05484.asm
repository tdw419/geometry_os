; DESCRIPTION: Renders a black line between points (384, 230) and (406, 158).
; PLAN: r0=384(x1), r1=230(y1), r2=406(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 230
LDI r2, 406
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
