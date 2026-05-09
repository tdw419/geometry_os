; DESCRIPTION: Renders a yellow line between points (271, 38) and (141, 254).
; PLAN: r0=271(x1), r1=38(y1), r2=141(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 38
LDI r2, 141
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
