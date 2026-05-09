; DESCRIPTION: Renders a yellow line between points (153, 204) and (164, 227).
; PLAN: r0=153(x1), r1=204(y1), r2=164(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 204
LDI r2, 164
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
