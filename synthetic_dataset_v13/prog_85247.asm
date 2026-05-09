; DESCRIPTION: Draws a white line from (101, 91) to (360, 131).
; PLAN: r0=101(x1), r1=91(y1), r2=360(x2), r3=131(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 91
LDI r2, 360
LDI r3, 131
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
