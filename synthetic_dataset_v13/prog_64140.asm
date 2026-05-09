; DESCRIPTION: Renders a green line between points (358, 128) and (122, 124).
; PLAN: r0=358(x1), r1=128(y1), r2=122(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 128
LDI r2, 122
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
