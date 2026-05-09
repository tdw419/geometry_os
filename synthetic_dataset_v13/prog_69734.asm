; DESCRIPTION: Draws a white line from (482, 181) to (456, 202).
; PLAN: r0=482(x1), r1=181(y1), r2=456(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 181
LDI r2, 456
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
