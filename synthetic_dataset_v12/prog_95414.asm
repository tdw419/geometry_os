; DESCRIPTION: Draws a white line from (378, 135) to (125, 198).
; PLAN: r0=378(x1), r1=135(y1), r2=125(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 135
LDI r2, 125
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
