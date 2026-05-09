; DESCRIPTION: Renders a cyan line between points (211, 136) and (250, 18).
; PLAN: r0=211(x1), r1=136(y1), r2=250(x2), r3=18(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 136
LDI r2, 250
LDI r3, 18
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
