; DESCRIPTION: Renders a white line between points (324, 18) and (17, 96).
; PLAN: r0=324(x1), r1=18(y1), r2=17(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 18
LDI r2, 17
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
