; DESCRIPTION: Draws a white line from (214, 2) to (134, 52).
; PLAN: r0=214(x1), r1=2(y1), r2=134(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 2
LDI r2, 134
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
