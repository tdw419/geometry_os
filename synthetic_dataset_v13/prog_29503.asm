; DESCRIPTION: Draws a red line from (207, 250) to (72, 233).
; PLAN: r0=207(x1), r1=250(y1), r2=72(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 250
LDI r2, 72
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
