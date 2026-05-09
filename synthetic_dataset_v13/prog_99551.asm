; DESCRIPTION: Draws a cyan line from (476, 103) to (495, 252).
; PLAN: r0=476(x1), r1=103(y1), r2=495(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 103
LDI r2, 495
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
