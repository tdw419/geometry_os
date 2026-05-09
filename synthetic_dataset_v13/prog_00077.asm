; DESCRIPTION: Draws a magenta line from (138, 122) to (261, 176).
; PLAN: r0=138(x1), r1=122(y1), r2=261(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 122
LDI r2, 261
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
