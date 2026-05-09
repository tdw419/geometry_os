; DESCRIPTION: Draws a white line from (96, 138) to (261, 251).
; PLAN: r0=96(x1), r1=138(y1), r2=261(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 138
LDI r2, 261
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
