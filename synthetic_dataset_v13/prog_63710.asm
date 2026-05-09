; DESCRIPTION: Renders a black line between points (164, 189) and (384, 90).
; PLAN: r0=164(x1), r1=189(y1), r2=384(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 189
LDI r2, 384
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
