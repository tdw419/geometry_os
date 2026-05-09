; DESCRIPTION: Draws a white line from (366, 9) to (178, 25).
; PLAN: r0=366(x1), r1=9(y1), r2=178(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 9
LDI r2, 178
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
