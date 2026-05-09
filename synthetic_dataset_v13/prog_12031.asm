; DESCRIPTION: Renders a black line between points (65, 255) and (269, 181).
; PLAN: r0=65(x1), r1=255(y1), r2=269(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 255
LDI r2, 269
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
