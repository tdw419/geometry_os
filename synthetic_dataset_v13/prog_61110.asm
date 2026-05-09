; DESCRIPTION: Draws a white line from (108, 203) to (153, 72).
; PLAN: r0=108(x1), r1=203(y1), r2=153(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 203
LDI r2, 153
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
