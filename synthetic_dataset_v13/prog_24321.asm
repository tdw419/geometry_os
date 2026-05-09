; DESCRIPTION: Renders a white line between points (84, 221) and (265, 200).
; PLAN: r0=84(x1), r1=221(y1), r2=265(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 221
LDI r2, 265
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
