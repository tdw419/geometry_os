; DESCRIPTION: Renders a green line between points (52, 151) and (334, 45).
; PLAN: r0=52(x1), r1=151(y1), r2=334(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 151
LDI r2, 334
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
