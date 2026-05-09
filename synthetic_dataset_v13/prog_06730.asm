; DESCRIPTION: Draws a white line from (342, 55) to (344, 226).
; PLAN: r0=342(x1), r1=55(y1), r2=344(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 55
LDI r2, 344
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
