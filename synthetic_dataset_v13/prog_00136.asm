; DESCRIPTION: Places a white line segment connecting (77, 115) to (111, 164).
; PLAN: r0=77(x1), r1=115(y1), r2=111(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 115
LDI r2, 111
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
