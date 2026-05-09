; DESCRIPTION: Draws a white line from (142, 44) to (59, 140).
; PLAN: r0=142(x1), r1=44(y1), r2=59(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 44
LDI r2, 59
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
