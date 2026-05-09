; DESCRIPTION: Renders a black line between points (204, 168) and (509, 6).
; PLAN: r0=204(x1), r1=168(y1), r2=509(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 168
LDI r2, 509
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
