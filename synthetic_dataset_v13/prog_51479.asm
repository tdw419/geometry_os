; DESCRIPTION: Renders a white line between points (433, 236) and (72, 199).
; PLAN: r0=433(x1), r1=236(y1), r2=72(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 236
LDI r2, 72
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
