; DESCRIPTION: Places a white line segment connecting (136, 11) to (117, 236).
; PLAN: r0=136(x1), r1=11(y1), r2=117(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 11
LDI r2, 117
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
