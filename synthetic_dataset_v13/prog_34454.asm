; DESCRIPTION: Renders a white line between points (490, 48) and (31, 195).
; PLAN: r0=490(x1), r1=48(y1), r2=31(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 48
LDI r2, 31
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
