; DESCRIPTION: Renders a cyan line between points (461, 183) and (17, 94).
; PLAN: r0=461(x1), r1=183(y1), r2=17(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 183
LDI r2, 17
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
