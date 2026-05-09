; DESCRIPTION: Draws a white line from (311, 91) to (113, 194).
; PLAN: r0=311(x1), r1=91(y1), r2=113(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 91
LDI r2, 113
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
