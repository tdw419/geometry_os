; DESCRIPTION: Draws a white line from (416, 167) to (473, 127).
; PLAN: r0=416(x1), r1=167(y1), r2=473(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 167
LDI r2, 473
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
