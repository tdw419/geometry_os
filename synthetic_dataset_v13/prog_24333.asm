; DESCRIPTION: Draws a white line from (114, 240) to (337, 28).
; PLAN: r0=114(x1), r1=240(y1), r2=337(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 240
LDI r2, 337
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
