; DESCRIPTION: Renders a white line between points (338, 197) and (417, 18).
; PLAN: r0=338(x1), r1=197(y1), r2=417(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 197
LDI r2, 417
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
