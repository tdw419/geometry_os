; DESCRIPTION: Renders a green line between points (420, 134) and (497, 38).
; PLAN: r0=420(x1), r1=134(y1), r2=497(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 134
LDI r2, 497
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
