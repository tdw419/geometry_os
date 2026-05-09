; DESCRIPTION: Places a white line segment connecting (321, 73) to (371, 124).
; PLAN: r0=321(x1), r1=73(y1), r2=371(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 73
LDI r2, 371
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
