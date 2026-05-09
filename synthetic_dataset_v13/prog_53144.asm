; DESCRIPTION: Draws a green line from (428, 138) to (291, 23).
; PLAN: r0=428(x1), r1=138(y1), r2=291(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 138
LDI r2, 291
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
