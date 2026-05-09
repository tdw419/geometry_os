; DESCRIPTION: Renders a yellow line between points (54, 117) and (403, 170).
; PLAN: r0=54(x1), r1=117(y1), r2=403(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 117
LDI r2, 403
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
