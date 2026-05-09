; DESCRIPTION: Draws a white line from (405, 57) to (396, 100).
; PLAN: r0=405(x1), r1=57(y1), r2=396(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 57
LDI r2, 396
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
