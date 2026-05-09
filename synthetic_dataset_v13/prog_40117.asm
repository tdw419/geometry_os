; DESCRIPTION: Renders a black line between points (302, 195) and (126, 248).
; PLAN: r0=302(x1), r1=195(y1), r2=126(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 195
LDI r2, 126
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
