; DESCRIPTION: Renders a white line between points (140, 75) and (209, 197).
; PLAN: r0=140(x1), r1=75(y1), r2=209(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 75
LDI r2, 209
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
