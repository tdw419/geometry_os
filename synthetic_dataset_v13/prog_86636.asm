; DESCRIPTION: Renders a yellow line between points (209, 251) and (353, 73).
; PLAN: r0=209(x1), r1=251(y1), r2=353(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 251
LDI r2, 353
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
