; DESCRIPTION: Renders a green line between points (126, 73) and (17, 122).
; PLAN: r0=126(x1), r1=73(y1), r2=17(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 73
LDI r2, 17
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
