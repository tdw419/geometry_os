; DESCRIPTION: Renders a white line between points (309, 159) and (304, 164).
; PLAN: r0=309(x1), r1=159(y1), r2=304(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 159
LDI r2, 304
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
