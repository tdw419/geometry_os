; DESCRIPTION: Renders a black line between points (204, 8) and (449, 50).
; PLAN: r0=204(x1), r1=8(y1), r2=449(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 8
LDI r2, 449
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
