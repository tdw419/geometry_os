; DESCRIPTION: Places a white line segment connecting (7, 121) to (498, 103).
; PLAN: r0=7(x1), r1=121(y1), r2=498(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 121
LDI r2, 498
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
