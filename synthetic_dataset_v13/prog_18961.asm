; DESCRIPTION: Draws a white line from (22, 238) to (72, 5).
; PLAN: r0=22(x1), r1=238(y1), r2=72(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 238
LDI r2, 72
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
