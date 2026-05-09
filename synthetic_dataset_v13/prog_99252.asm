; DESCRIPTION: Draws a white line from (103, 62) to (357, 23).
; PLAN: r0=103(x1), r1=62(y1), r2=357(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 62
LDI r2, 357
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
