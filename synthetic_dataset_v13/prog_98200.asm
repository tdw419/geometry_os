; DESCRIPTION: Draws a white line from (264, 81) to (14, 43).
; PLAN: r0=264(x1), r1=81(y1), r2=14(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 81
LDI r2, 14
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
