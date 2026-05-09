; DESCRIPTION: Draws a cyan line from (297, 227) to (495, 79).
; PLAN: r0=297(x1), r1=227(y1), r2=495(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 227
LDI r2, 495
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
