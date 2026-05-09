; DESCRIPTION: Renders a cyan line between points (452, 227) and (320, 201).
; PLAN: r0=452(x1), r1=227(y1), r2=320(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 227
LDI r2, 320
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
