; DESCRIPTION: Renders a cyan line between points (463, 51) and (282, 248).
; PLAN: r0=463(x1), r1=51(y1), r2=282(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 51
LDI r2, 282
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
