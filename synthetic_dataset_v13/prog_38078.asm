; DESCRIPTION: Draws a white line from (108, 56) to (277, 53).
; PLAN: r0=108(x1), r1=56(y1), r2=277(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 56
LDI r2, 277
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
