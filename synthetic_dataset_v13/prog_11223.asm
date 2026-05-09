; DESCRIPTION: Draws a white line from (75, 69) to (53, 30).
; PLAN: r0=75(x1), r1=69(y1), r2=53(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 69
LDI r2, 53
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
