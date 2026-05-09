; DESCRIPTION: Renders a cyan line between points (129, 84) and (104, 64).
; PLAN: r0=129(x1), r1=84(y1), r2=104(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 84
LDI r2, 104
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
