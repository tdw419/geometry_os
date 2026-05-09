; DESCRIPTION: Places a white line segment connecting (256, 51) to (380, 185).
; PLAN: r0=256(x1), r1=51(y1), r2=380(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 51
LDI r2, 380
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
