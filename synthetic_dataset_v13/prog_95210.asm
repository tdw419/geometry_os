; DESCRIPTION: Draws a white line from (53, 91) to (58, 10).
; PLAN: r0=53(x1), r1=91(y1), r2=58(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 91
LDI r2, 58
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
