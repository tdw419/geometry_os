; DESCRIPTION: Draws a white line from (447, 236) to (359, 195).
; PLAN: r0=447(x1), r1=236(y1), r2=359(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 236
LDI r2, 359
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
