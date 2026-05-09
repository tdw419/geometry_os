; DESCRIPTION: Renders a black line between points (82, 212) and (320, 130).
; PLAN: r0=82(x1), r1=212(y1), r2=320(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 212
LDI r2, 320
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
