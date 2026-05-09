; DESCRIPTION: Renders a black line between points (269, 53) and (371, 89).
; PLAN: r0=269(x1), r1=53(y1), r2=371(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 53
LDI r2, 371
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
