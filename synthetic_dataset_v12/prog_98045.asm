; DESCRIPTION: Draws a white line from (198, 101) to (102, 255).
; PLAN: r0=198(x1), r1=101(y1), r2=102(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 101
LDI r2, 102
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
