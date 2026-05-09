; DESCRIPTION: Draws a white line from (454, 241) to (166, 38).
; PLAN: r0=454(x1), r1=241(y1), r2=166(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 241
LDI r2, 166
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
