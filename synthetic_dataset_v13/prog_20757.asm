; DESCRIPTION: Draws a white line from (464, 92) to (103, 100).
; PLAN: r0=464(x1), r1=92(y1), r2=103(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 92
LDI r2, 103
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
