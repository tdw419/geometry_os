; DESCRIPTION: Renders a yellow line between points (471, 79) and (256, 86).
; PLAN: r0=471(x1), r1=79(y1), r2=256(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 79
LDI r2, 256
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
