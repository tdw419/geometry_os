; DESCRIPTION: Renders a cyan line between points (219, 179) and (106, 176).
; PLAN: r0=219(x1), r1=179(y1), r2=106(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 179
LDI r2, 106
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
