; DESCRIPTION: Renders a black line between points (221, 110) and (264, 128).
; PLAN: r0=221(x1), r1=110(y1), r2=264(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 110
LDI r2, 264
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
