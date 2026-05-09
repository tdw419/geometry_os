; DESCRIPTION: Draws a white line from (44, 87) to (83, 67).
; PLAN: r0=44(x1), r1=87(y1), r2=83(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 87
LDI r2, 83
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
