; DESCRIPTION: Draws a white line from (475, 247) to (331, 20).
; PLAN: r0=475(x1), r1=247(y1), r2=331(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 247
LDI r2, 331
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
