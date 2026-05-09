; DESCRIPTION: Renders a black line between points (372, 157) and (364, 10).
; PLAN: r0=372(x1), r1=157(y1), r2=364(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 157
LDI r2, 364
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
