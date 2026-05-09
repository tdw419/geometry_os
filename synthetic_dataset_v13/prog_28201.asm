; DESCRIPTION: Renders a white line between points (326, 83) and (251, 197).
; PLAN: r0=326(x1), r1=83(y1), r2=251(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 83
LDI r2, 251
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
