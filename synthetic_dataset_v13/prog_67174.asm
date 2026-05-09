; DESCRIPTION: Draws a white line from (131, 79) to (12, 178).
; PLAN: r0=131(x1), r1=79(y1), r2=12(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 79
LDI r2, 12
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
