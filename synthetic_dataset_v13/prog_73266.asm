; DESCRIPTION: Renders a white line between points (431, 84) and (246, 220).
; PLAN: r0=431(x1), r1=84(y1), r2=246(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 84
LDI r2, 246
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
