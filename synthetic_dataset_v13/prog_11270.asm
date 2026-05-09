; DESCRIPTION: Draws a white line from (1, 1) to (462, 1).
; PLAN: r0=1(x1), r1=1(y1), r2=462(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 1
LDI r2, 462
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
