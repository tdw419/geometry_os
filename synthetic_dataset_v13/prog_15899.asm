; DESCRIPTION: Renders a green line between points (270, 186) and (184, 204).
; PLAN: r0=270(x1), r1=186(y1), r2=184(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 186
LDI r2, 184
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
