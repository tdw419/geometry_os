; DESCRIPTION: Draws a white line from (283, 17) to (508, 72).
; PLAN: r0=283(x1), r1=17(y1), r2=508(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 17
LDI r2, 508
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
