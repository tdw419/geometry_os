; DESCRIPTION: Renders a green line between points (195, 178) and (390, 173).
; PLAN: r0=195(x1), r1=178(y1), r2=390(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 178
LDI r2, 390
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
