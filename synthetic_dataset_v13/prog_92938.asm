; DESCRIPTION: Renders a yellow line between points (189, 157) and (370, 124).
; PLAN: r0=189(x1), r1=157(y1), r2=370(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 157
LDI r2, 370
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
