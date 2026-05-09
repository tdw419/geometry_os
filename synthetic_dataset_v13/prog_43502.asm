; DESCRIPTION: Draws a white line from (142, 225) to (406, 187).
; PLAN: r0=142(x1), r1=225(y1), r2=406(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 225
LDI r2, 406
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
