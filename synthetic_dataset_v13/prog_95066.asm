; DESCRIPTION: Renders a green line between points (195, 225) and (423, 60).
; PLAN: r0=195(x1), r1=225(y1), r2=423(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 225
LDI r2, 423
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
