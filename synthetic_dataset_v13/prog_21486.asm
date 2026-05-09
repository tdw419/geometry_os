; DESCRIPTION: Draws a cyan line from (447, 116) to (61, 137).
; PLAN: r0=447(x1), r1=116(y1), r2=61(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 116
LDI r2, 61
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
