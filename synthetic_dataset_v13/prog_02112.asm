; DESCRIPTION: Renders a white line between points (177, 104) and (468, 239).
; PLAN: r0=177(x1), r1=104(y1), r2=468(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 104
LDI r2, 468
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
