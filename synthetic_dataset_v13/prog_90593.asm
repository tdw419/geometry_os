; DESCRIPTION: Renders a cyan line between points (174, 102) and (478, 172).
; PLAN: r0=174(x1), r1=102(y1), r2=478(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 102
LDI r2, 478
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
