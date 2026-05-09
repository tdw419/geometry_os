; DESCRIPTION: Renders a black line between points (29, 249) and (509, 188).
; PLAN: r0=29(x1), r1=249(y1), r2=509(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 249
LDI r2, 509
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
