; DESCRIPTION: Renders a cyan line between points (506, 139) and (87, 94).
; PLAN: r0=506(x1), r1=139(y1), r2=87(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 139
LDI r2, 87
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
