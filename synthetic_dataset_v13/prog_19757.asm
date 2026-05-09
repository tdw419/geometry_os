; DESCRIPTION: Renders a green line between points (407, 174) and (433, 212).
; PLAN: r0=407(x1), r1=174(y1), r2=433(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 174
LDI r2, 433
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
