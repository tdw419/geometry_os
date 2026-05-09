; DESCRIPTION: Draws a white line from (360, 114) to (80, 40).
; PLAN: r0=360(x1), r1=114(y1), r2=80(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 114
LDI r2, 80
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
