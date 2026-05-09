; DESCRIPTION: Draws a black line from (143, 85) to (256, 130).
; PLAN: r0=143(x1), r1=85(y1), r2=256(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 85
LDI r2, 256
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
