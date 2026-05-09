; DESCRIPTION: Renders a green line between points (90, 175) and (128, 227).
; PLAN: r0=90(x1), r1=175(y1), r2=128(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 175
LDI r2, 128
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
