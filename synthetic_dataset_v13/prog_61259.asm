; DESCRIPTION: Renders a cyan line between points (183, 15) and (179, 112).
; PLAN: r0=183(x1), r1=15(y1), r2=179(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 15
LDI r2, 179
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
