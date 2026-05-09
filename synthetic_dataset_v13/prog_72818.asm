; DESCRIPTION: Draws a white line from (17, 163) to (388, 33).
; PLAN: r0=17(x1), r1=163(y1), r2=388(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 163
LDI r2, 388
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
