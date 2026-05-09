; DESCRIPTION: Renders a cyan line between points (448, 161) and (414, 175).
; PLAN: r0=448(x1), r1=161(y1), r2=414(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 161
LDI r2, 414
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
