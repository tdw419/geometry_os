; DESCRIPTION: Draws a white line from (335, 121) to (196, 246).
; PLAN: r0=335(x1), r1=121(y1), r2=196(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 121
LDI r2, 196
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
