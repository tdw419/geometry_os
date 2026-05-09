; DESCRIPTION: Renders a green line between points (459, 11) and (367, 197).
; PLAN: r0=459(x1), r1=11(y1), r2=367(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 11
LDI r2, 367
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
