; DESCRIPTION: Draws a white line from (357, 5) to (138, 3).
; PLAN: r0=357(x1), r1=5(y1), r2=138(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 5
LDI r2, 138
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
