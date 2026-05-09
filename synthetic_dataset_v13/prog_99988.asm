; DESCRIPTION: Renders a green line between points (2, 232) and (197, 12).
; PLAN: r0=2(x1), r1=232(y1), r2=197(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 232
LDI r2, 197
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
