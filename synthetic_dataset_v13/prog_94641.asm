; DESCRIPTION: Draws a white line from (96, 30) to (23, 153).
; PLAN: r0=96(x1), r1=30(y1), r2=23(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 30
LDI r2, 23
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
