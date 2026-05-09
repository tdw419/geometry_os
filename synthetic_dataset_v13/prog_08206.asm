; DESCRIPTION: Renders a cyan line between points (309, 170) and (478, 25).
; PLAN: r0=309(x1), r1=170(y1), r2=478(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 170
LDI r2, 478
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
