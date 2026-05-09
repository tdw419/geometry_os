; DESCRIPTION: Renders a black line between points (424, 40) and (73, 128).
; PLAN: r0=424(x1), r1=40(y1), r2=73(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 40
LDI r2, 73
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
