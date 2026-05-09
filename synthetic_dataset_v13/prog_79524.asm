; DESCRIPTION: Renders a black line between points (354, 139) and (258, 193).
; PLAN: r0=354(x1), r1=139(y1), r2=258(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 139
LDI r2, 258
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
