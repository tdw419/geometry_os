; DESCRIPTION: Renders a black line between points (139, 4) and (330, 173).
; PLAN: r0=139(x1), r1=4(y1), r2=330(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 4
LDI r2, 330
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
