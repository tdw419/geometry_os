; DESCRIPTION: Renders a cyan line between points (478, 221) and (332, 97).
; PLAN: r0=478(x1), r1=221(y1), r2=332(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 221
LDI r2, 332
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
