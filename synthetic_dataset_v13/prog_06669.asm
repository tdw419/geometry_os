; DESCRIPTION: Draws a white line from (308, 212) to (144, 179).
; PLAN: r0=308(x1), r1=212(y1), r2=144(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 212
LDI r2, 144
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
