; DESCRIPTION: Renders a green line between points (358, 251) and (160, 144).
; PLAN: r0=358(x1), r1=251(y1), r2=160(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 251
LDI r2, 160
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
