; DESCRIPTION: Renders a black line between points (403, 47) and (36, 254).
; PLAN: r0=403(x1), r1=47(y1), r2=36(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 47
LDI r2, 36
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
