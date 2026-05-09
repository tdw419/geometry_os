; DESCRIPTION: Draws a white line from (270, 175) to (445, 118).
; PLAN: r0=270(x1), r1=175(y1), r2=445(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 175
LDI r2, 445
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
