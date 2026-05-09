; DESCRIPTION: Renders a black line between points (54, 221) and (67, 219).
; PLAN: r0=54(x1), r1=221(y1), r2=67(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 221
LDI r2, 67
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
