; DESCRIPTION: Renders a black line between points (506, 175) and (32, 236).
; PLAN: r0=506(x1), r1=175(y1), r2=32(x2), r3=236(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 175
LDI r2, 32
LDI r3, 236
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
