; DESCRIPTION: Draws a white line from (88, 22) to (327, 44).
; PLAN: r0=88(x1), r1=22(y1), r2=327(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 22
LDI r2, 327
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
