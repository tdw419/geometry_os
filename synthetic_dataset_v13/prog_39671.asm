; DESCRIPTION: Renders a green line between points (348, 98) and (160, 44).
; PLAN: r0=348(x1), r1=98(y1), r2=160(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 98
LDI r2, 160
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
