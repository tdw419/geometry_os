; DESCRIPTION: Draws a white line from (389, 124) to (134, 204).
; PLAN: r0=389(x1), r1=124(y1), r2=134(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 124
LDI r2, 134
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
