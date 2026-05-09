; DESCRIPTION: Draws a white line from (339, 36) to (49, 214).
; PLAN: r0=339(x1), r1=36(y1), r2=49(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 36
LDI r2, 49
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
