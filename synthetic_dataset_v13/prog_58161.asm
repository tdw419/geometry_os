; DESCRIPTION: Draws a red line from (297, 175) to (308, 13).
; PLAN: r0=297(x1), r1=175(y1), r2=308(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 175
LDI r2, 308
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
