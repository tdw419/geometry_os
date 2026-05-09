; DESCRIPTION: Draws a magenta line from (306, 152) to (261, 90).
; PLAN: r0=306(x1), r1=152(y1), r2=261(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 152
LDI r2, 261
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
