; DESCRIPTION: Draws a white line from (122, 49) to (420, 31).
; PLAN: r0=122(x1), r1=49(y1), r2=420(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 49
LDI r2, 420
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
