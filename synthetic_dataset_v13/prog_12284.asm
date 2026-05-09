; DESCRIPTION: Renders a black line between points (9, 128) and (144, 72).
; PLAN: r0=9(x1), r1=128(y1), r2=144(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 128
LDI r2, 144
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
