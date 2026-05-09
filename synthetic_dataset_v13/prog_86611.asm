; DESCRIPTION: Draws a white line from (370, 15) to (10, 108).
; PLAN: r0=370(x1), r1=15(y1), r2=10(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 15
LDI r2, 10
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
