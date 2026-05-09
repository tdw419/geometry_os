; DESCRIPTION: Renders a cyan line between points (425, 204) and (90, 201).
; PLAN: r0=425(x1), r1=204(y1), r2=90(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 204
LDI r2, 90
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
