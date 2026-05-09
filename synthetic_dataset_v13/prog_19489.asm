; DESCRIPTION: Renders a white line between points (261, 16) and (212, 114).
; PLAN: r0=261(x1), r1=16(y1), r2=212(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 16
LDI r2, 212
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
