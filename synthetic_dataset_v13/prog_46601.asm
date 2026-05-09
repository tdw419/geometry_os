; DESCRIPTION: Renders a black line between points (26, 197) and (436, 168).
; PLAN: r0=26(x1), r1=197(y1), r2=436(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 197
LDI r2, 436
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
