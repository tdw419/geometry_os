; DESCRIPTION: Draws a white line from (13, 26) to (74, 19).
; PLAN: r0=13(x1), r1=26(y1), r2=74(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 26
LDI r2, 74
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
