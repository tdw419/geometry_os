; DESCRIPTION: Draws a white line from (349, 45) to (214, 134).
; PLAN: r0=349(x1), r1=45(y1), r2=214(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 45
LDI r2, 214
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
