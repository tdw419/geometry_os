; DESCRIPTION: Renders a green line between points (369, 167) and (61, 50).
; PLAN: r0=369(x1), r1=167(y1), r2=61(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 167
LDI r2, 61
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
