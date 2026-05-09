; DESCRIPTION: Renders a white line between points (34, 179) and (128, 99).
; PLAN: r0=34(x1), r1=179(y1), r2=128(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 179
LDI r2, 128
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
