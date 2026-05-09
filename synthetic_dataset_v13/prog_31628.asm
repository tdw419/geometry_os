; DESCRIPTION: Renders a white line between points (338, 102) and (66, 176).
; PLAN: r0=338(x1), r1=102(y1), r2=66(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 102
LDI r2, 66
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
