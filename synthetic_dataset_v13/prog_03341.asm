; DESCRIPTION: Draws a white line from (151, 36) to (362, 251).
; PLAN: r0=151(x1), r1=36(y1), r2=362(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 36
LDI r2, 362
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
