; DESCRIPTION: Renders a cyan line between points (163, 102) and (283, 217).
; PLAN: r0=163(x1), r1=102(y1), r2=283(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 102
LDI r2, 283
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
