; DESCRIPTION: Places a white line segment connecting (200, 166) to (79, 95).
; PLAN: r0=200(x1), r1=166(y1), r2=79(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 166
LDI r2, 79
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
