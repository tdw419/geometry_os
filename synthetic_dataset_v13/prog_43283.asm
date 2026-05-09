; DESCRIPTION: Renders a green line between points (47, 25) and (439, 24).
; PLAN: r0=47(x1), r1=25(y1), r2=439(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 25
LDI r2, 439
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
