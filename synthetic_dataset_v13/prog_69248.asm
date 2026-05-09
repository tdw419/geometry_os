; DESCRIPTION: Renders a black line between points (211, 205) and (72, 139).
; PLAN: r0=211(x1), r1=205(y1), r2=72(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 205
LDI r2, 72
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
