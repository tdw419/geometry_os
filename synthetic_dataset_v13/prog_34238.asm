; DESCRIPTION: Renders a cyan line between points (382, 118) and (478, 29).
; PLAN: r0=382(x1), r1=118(y1), r2=478(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 118
LDI r2, 478
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
