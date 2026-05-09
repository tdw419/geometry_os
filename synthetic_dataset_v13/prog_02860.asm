; DESCRIPTION: Draws a green line from (133, 19) to (117, 56).
; PLAN: r0=133(x1), r1=19(y1), r2=117(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 19
LDI r2, 117
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
