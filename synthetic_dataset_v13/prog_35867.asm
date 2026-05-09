; DESCRIPTION: Draws a white line from (461, 11) to (313, 222).
; PLAN: r0=461(x1), r1=11(y1), r2=313(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 11
LDI r2, 313
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
