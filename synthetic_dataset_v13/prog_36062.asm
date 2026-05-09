; DESCRIPTION: Draws a white line from (56, 184) to (175, 6).
; PLAN: r0=56(x1), r1=184(y1), r2=175(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 184
LDI r2, 175
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
