; DESCRIPTION: Renders a green line between points (118, 195) and (497, 192).
; PLAN: r0=118(x1), r1=195(y1), r2=497(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 195
LDI r2, 497
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
