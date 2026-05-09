; DESCRIPTION: Places a white line segment connecting (81, 202) to (441, 115).
; PLAN: r0=81(x1), r1=202(y1), r2=441(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 202
LDI r2, 441
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
