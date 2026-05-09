; DESCRIPTION: Renders a cyan line between points (395, 159) and (402, 51).
; PLAN: r0=395(x1), r1=159(y1), r2=402(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 159
LDI r2, 402
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
