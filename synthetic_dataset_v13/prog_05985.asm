; DESCRIPTION: Draws a green line from (174, 14) to (447, 52).
; PLAN: r0=174(x1), r1=14(y1), r2=447(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 14
LDI r2, 447
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
