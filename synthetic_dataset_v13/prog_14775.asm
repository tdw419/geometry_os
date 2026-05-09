; DESCRIPTION: Renders a cyan line between points (11, 205) and (448, 24).
; PLAN: r0=11(x1), r1=205(y1), r2=448(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 205
LDI r2, 448
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
