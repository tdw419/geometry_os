; DESCRIPTION: Renders a black line between points (418, 139) and (214, 2).
; PLAN: r0=418(x1), r1=139(y1), r2=214(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 139
LDI r2, 214
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
