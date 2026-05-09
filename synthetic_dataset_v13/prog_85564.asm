; DESCRIPTION: Renders a purple line between points (417, 94) and (509, 215).
; PLAN: r0=417(x1), r1=94(y1), r2=509(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 94
LDI r2, 509
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
