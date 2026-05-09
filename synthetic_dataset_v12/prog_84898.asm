; DESCRIPTION: Renders a blue line between points (31, 248) and (128, 243).
; PLAN: r0=31(x1), r1=248(y1), r2=128(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 248
LDI r2, 128
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
