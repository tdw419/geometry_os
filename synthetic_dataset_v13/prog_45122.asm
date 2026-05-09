; DESCRIPTION: Draws a green line from (447, 73) to (344, 196).
; PLAN: r0=447(x1), r1=73(y1), r2=344(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 73
LDI r2, 344
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
