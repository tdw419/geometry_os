; DESCRIPTION: Renders a black line between points (481, 107) and (278, 244).
; PLAN: r0=481(x1), r1=107(y1), r2=278(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 107
LDI r2, 278
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
