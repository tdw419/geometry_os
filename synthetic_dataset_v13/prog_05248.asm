; DESCRIPTION: Renders a yellow line between points (204, 182) and (398, 155).
; PLAN: r0=204(x1), r1=182(y1), r2=398(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 182
LDI r2, 398
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
