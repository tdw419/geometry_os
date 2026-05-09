; DESCRIPTION: Renders a black line between points (176, 41) and (320, 183).
; PLAN: r0=176(x1), r1=41(y1), r2=320(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 41
LDI r2, 320
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
