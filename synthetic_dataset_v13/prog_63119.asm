; DESCRIPTION: Renders a white line between points (497, 58) and (433, 222).
; PLAN: r0=497(x1), r1=58(y1), r2=433(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 58
LDI r2, 433
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
