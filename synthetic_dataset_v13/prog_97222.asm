; DESCRIPTION: Renders a yellow line between points (226, 255) and (45, 69).
; PLAN: r0=226(x1), r1=255(y1), r2=45(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 255
LDI r2, 45
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
