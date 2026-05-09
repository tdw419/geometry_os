; DESCRIPTION: Renders a black line between points (365, 62) and (255, 81).
; PLAN: r0=365(x1), r1=62(y1), r2=255(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 62
LDI r2, 255
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
