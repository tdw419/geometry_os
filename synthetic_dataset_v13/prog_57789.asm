; DESCRIPTION: Renders a yellow line between points (403, 192) and (306, 0).
; PLAN: r0=403(x1), r1=192(y1), r2=306(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 192
LDI r2, 306
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
