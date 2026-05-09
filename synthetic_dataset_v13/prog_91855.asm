; DESCRIPTION: Renders a black line between points (114, 144) and (438, 50).
; PLAN: r0=114(x1), r1=144(y1), r2=438(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 144
LDI r2, 438
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
