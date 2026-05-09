; DESCRIPTION: Renders a green line between points (323, 253) and (4, 153).
; PLAN: r0=323(x1), r1=253(y1), r2=4(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 253
LDI r2, 4
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
