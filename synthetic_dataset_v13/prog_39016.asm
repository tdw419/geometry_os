; DESCRIPTION: Renders a cyan line between points (498, 136) and (325, 214).
; PLAN: r0=498(x1), r1=136(y1), r2=325(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 136
LDI r2, 325
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
