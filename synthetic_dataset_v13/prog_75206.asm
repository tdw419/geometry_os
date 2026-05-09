; DESCRIPTION: Draws a yellow line from (428, 19) to (261, 57).
; PLAN: r0=428(x1), r1=19(y1), r2=261(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 19
LDI r2, 261
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
