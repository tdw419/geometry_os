; DESCRIPTION: Renders a black line between points (354, 50) and (142, 43).
; PLAN: r0=354(x1), r1=50(y1), r2=142(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 50
LDI r2, 142
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
