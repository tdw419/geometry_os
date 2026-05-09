; DESCRIPTION: Renders a cyan line between points (183, 3) and (176, 136).
; PLAN: r0=183(x1), r1=3(y1), r2=176(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 3
LDI r2, 176
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
