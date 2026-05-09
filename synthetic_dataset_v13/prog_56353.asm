; DESCRIPTION: Renders a black line between points (340, 211) and (131, 139).
; PLAN: r0=340(x1), r1=211(y1), r2=131(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 211
LDI r2, 131
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
