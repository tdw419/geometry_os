; DESCRIPTION: Renders a white line between points (478, 210) and (256, 176).
; PLAN: r0=478(x1), r1=210(y1), r2=256(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 210
LDI r2, 256
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
