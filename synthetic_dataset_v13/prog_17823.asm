; DESCRIPTION: Draws a white line from (414, 18) to (291, 23).
; PLAN: r0=414(x1), r1=18(y1), r2=291(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 18
LDI r2, 291
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
