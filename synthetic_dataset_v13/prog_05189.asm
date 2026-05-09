; DESCRIPTION: Renders a orange line between points (478, 246) and (417, 213).
; PLAN: r0=478(x1), r1=246(y1), r2=417(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 246
LDI r2, 417
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
