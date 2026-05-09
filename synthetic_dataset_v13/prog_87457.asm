; DESCRIPTION: Draws a white line from (505, 165) to (406, 247).
; PLAN: r0=505(x1), r1=165(y1), r2=406(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 165
LDI r2, 406
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
