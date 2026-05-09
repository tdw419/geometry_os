; DESCRIPTION: Renders a purple line between points (115, 255) and (176, 27).
; PLAN: r0=115(x1), r1=255(y1), r2=176(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 255
LDI r2, 176
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
