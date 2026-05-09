; DESCRIPTION: Renders a white line between points (215, 86) and (444, 97).
; PLAN: r0=215(x1), r1=86(y1), r2=444(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 86
LDI r2, 444
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
