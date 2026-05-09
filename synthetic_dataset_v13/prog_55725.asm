; DESCRIPTION: Renders a black line between points (304, 172) and (84, 63).
; PLAN: r0=304(x1), r1=172(y1), r2=84(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 172
LDI r2, 84
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
