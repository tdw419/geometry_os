; DESCRIPTION: Draws a white line from (380, 81) to (214, 158).
; PLAN: r0=380(x1), r1=81(y1), r2=214(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 81
LDI r2, 214
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
