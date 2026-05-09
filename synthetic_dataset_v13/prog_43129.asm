; DESCRIPTION: Draws a white line from (65, 172) to (308, 52).
; PLAN: r0=65(x1), r1=172(y1), r2=308(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 172
LDI r2, 308
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
