; DESCRIPTION: Draws a white line from (436, 57) to (488, 153).
; PLAN: r0=436(x1), r1=57(y1), r2=488(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 57
LDI r2, 488
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
