; DESCRIPTION: Draws a white line from (466, 117) to (383, 198).
; PLAN: r0=466(x1), r1=117(y1), r2=383(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 117
LDI r2, 383
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
