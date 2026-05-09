; DESCRIPTION: Draws a white line from (74, 205) to (312, 135).
; PLAN: r0=74(x1), r1=205(y1), r2=312(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 205
LDI r2, 312
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
