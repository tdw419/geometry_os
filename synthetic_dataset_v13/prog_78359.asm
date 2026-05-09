; DESCRIPTION: Draws a white line from (352, 163) to (354, 112).
; PLAN: r0=352(x1), r1=163(y1), r2=354(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 163
LDI r2, 354
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
