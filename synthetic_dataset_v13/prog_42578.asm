; DESCRIPTION: Renders a yellow line between points (347, 47) and (14, 128).
; PLAN: r0=347(x1), r1=47(y1), r2=14(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 47
LDI r2, 14
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
