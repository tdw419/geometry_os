; DESCRIPTION: Places a white line segment connecting (425, 253) to (238, 47).
; PLAN: r0=425(x1), r1=253(y1), r2=238(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 253
LDI r2, 238
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
