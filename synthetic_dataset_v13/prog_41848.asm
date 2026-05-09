; DESCRIPTION: Draws a white line from (334, 151) to (441, 139).
; PLAN: r0=334(x1), r1=151(y1), r2=441(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 151
LDI r2, 441
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
