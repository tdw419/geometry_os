; DESCRIPTION: Draws a white line from (134, 57) to (466, 19).
; PLAN: r0=134(x1), r1=57(y1), r2=466(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 57
LDI r2, 466
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
