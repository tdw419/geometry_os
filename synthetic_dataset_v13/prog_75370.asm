; DESCRIPTION: Renders a black line between points (351, 184) and (384, 253).
; PLAN: r0=351(x1), r1=184(y1), r2=384(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 184
LDI r2, 384
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
