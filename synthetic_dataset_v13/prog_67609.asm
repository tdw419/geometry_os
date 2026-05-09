; DESCRIPTION: Renders a green line between points (332, 210) and (52, 179).
; PLAN: r0=332(x1), r1=210(y1), r2=52(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 210
LDI r2, 52
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
