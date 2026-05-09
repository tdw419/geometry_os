; DESCRIPTION: Renders a cyan line between points (268, 75) and (104, 180).
; PLAN: r0=268(x1), r1=75(y1), r2=104(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 75
LDI r2, 104
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
