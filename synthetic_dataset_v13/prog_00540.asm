; DESCRIPTION: Renders a cyan line between points (155, 172) and (14, 234).
; PLAN: r0=155(x1), r1=172(y1), r2=14(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 172
LDI r2, 14
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
