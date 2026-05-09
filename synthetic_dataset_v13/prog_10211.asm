; DESCRIPTION: Renders a white line between points (248, 170) and (333, 93).
; PLAN: r0=248(x1), r1=170(y1), r2=333(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 170
LDI r2, 333
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
