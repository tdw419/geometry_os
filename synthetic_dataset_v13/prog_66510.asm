; DESCRIPTION: Draws a white line from (175, 184) to (150, 47).
; PLAN: r0=175(x1), r1=184(y1), r2=150(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 184
LDI r2, 150
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
