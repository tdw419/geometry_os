; DESCRIPTION: Renders a green line between points (97, 128) and (218, 211).
; PLAN: r0=97(x1), r1=128(y1), r2=218(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 128
LDI r2, 218
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
