; DESCRIPTION: Renders a white line between points (420, 188) and (497, 241).
; PLAN: r0=420(x1), r1=188(y1), r2=497(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 188
LDI r2, 497
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
