; DESCRIPTION: Draws a white line from (54, 236) to (289, 61).
; PLAN: r0=54(x1), r1=236(y1), r2=289(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 236
LDI r2, 289
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
