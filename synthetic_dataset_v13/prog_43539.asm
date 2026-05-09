; DESCRIPTION: Draws a white line from (95, 194) to (8, 20).
; PLAN: r0=95(x1), r1=194(y1), r2=8(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 194
LDI r2, 8
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
