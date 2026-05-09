; DESCRIPTION: Renders a white line between points (225, 28) and (97, 246).
; PLAN: r0=225(x1), r1=28(y1), r2=97(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 28
LDI r2, 97
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
