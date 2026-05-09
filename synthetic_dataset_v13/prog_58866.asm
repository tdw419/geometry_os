; DESCRIPTION: Draws a white line from (166, 49) to (175, 75).
; PLAN: r0=166(x1), r1=49(y1), r2=175(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 49
LDI r2, 175
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
