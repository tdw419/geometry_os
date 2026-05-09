; DESCRIPTION: Renders a green line between points (506, 225) and (323, 164).
; PLAN: r0=506(x1), r1=225(y1), r2=323(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 225
LDI r2, 323
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
