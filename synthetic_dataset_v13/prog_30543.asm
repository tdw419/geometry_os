; DESCRIPTION: Places a white line segment connecting (394, 178) to (238, 241).
; PLAN: r0=394(x1), r1=178(y1), r2=238(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 178
LDI r2, 238
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
