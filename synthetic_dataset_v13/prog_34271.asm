; DESCRIPTION: Renders a black line between points (226, 206) and (364, 178).
; PLAN: r0=226(x1), r1=206(y1), r2=364(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 206
LDI r2, 364
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
