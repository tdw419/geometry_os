; DESCRIPTION: Renders a black line between points (43, 42) and (200, 223).
; PLAN: r0=43(x1), r1=42(y1), r2=200(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 42
LDI r2, 200
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
