; DESCRIPTION: Renders a white line between points (13, 4) and (384, 179).
; PLAN: r0=13(x1), r1=4(y1), r2=384(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 4
LDI r2, 384
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
