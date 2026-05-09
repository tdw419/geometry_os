; DESCRIPTION: Draws a white line from (87, 101) to (175, 187).
; PLAN: r0=87(x1), r1=101(y1), r2=175(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 101
LDI r2, 175
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
