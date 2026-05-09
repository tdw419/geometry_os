; DESCRIPTION: Renders a cyan line between points (65, 17) and (139, 207).
; PLAN: r0=65(x1), r1=17(y1), r2=139(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 17
LDI r2, 139
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
