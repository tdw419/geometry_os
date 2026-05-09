; DESCRIPTION: Renders a green line between points (254, 232) and (195, 40).
; PLAN: r0=254(x1), r1=232(y1), r2=195(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 232
LDI r2, 195
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
