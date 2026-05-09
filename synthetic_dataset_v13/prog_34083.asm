; DESCRIPTION: Renders a yellow line between points (120, 238) and (497, 86).
; PLAN: r0=120(x1), r1=238(y1), r2=497(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 238
LDI r2, 497
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
