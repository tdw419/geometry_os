; DESCRIPTION: Renders a white line between points (309, 180) and (107, 183).
; PLAN: r0=309(x1), r1=180(y1), r2=107(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 180
LDI r2, 107
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
