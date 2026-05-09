; DESCRIPTION: Draws a white line from (120, 64) to (15, 137).
; PLAN: r0=120(x1), r1=64(y1), r2=15(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 64
LDI r2, 15
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
