; DESCRIPTION: Renders a green line between points (129, 161) and (289, 192).
; PLAN: r0=129(x1), r1=161(y1), r2=289(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 161
LDI r2, 289
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
