; DESCRIPTION: Renders a green line between points (424, 221) and (462, 24).
; PLAN: r0=424(x1), r1=221(y1), r2=462(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 221
LDI r2, 462
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
