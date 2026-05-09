; DESCRIPTION: Renders a white line between points (497, 244) and (90, 54).
; PLAN: r0=497(x1), r1=244(y1), r2=90(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 244
LDI r2, 90
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
