; DESCRIPTION: Renders a black line between points (168, 64) and (238, 62).
; PLAN: r0=168(x1), r1=64(y1), r2=238(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 64
LDI r2, 238
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
