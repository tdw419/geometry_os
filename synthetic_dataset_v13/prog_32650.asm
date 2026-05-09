; DESCRIPTION: Renders a purple line between points (509, 193) and (320, 248).
; PLAN: r0=509(x1), r1=193(y1), r2=320(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 193
LDI r2, 320
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
