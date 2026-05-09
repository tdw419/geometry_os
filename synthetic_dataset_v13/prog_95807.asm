; DESCRIPTION: Renders a yellow line between points (233, 221) and (260, 204).
; PLAN: r0=233(x1), r1=221(y1), r2=260(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 221
LDI r2, 260
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
