; DESCRIPTION: Draws a red line from (313, 162) to (366, 40).
; PLAN: r0=313(x1), r1=162(y1), r2=366(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 162
LDI r2, 366
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
