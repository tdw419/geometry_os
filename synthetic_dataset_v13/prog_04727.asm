; DESCRIPTION: Renders a black line between points (184, 192) and (166, 204).
; PLAN: r0=184(x1), r1=192(y1), r2=166(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 192
LDI r2, 166
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
