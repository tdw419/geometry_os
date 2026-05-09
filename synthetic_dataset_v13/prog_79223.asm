; DESCRIPTION: Draws a white line from (20, 131) to (408, 30).
; PLAN: r0=20(x1), r1=131(y1), r2=408(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 131
LDI r2, 408
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
