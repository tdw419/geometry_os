; DESCRIPTION: Draws a black line from (341, 255) to (320, 93).
; PLAN: r0=341(x1), r1=255(y1), r2=320(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 255
LDI r2, 320
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
