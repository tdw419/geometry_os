; DESCRIPTION: Draws a magenta line from (217, 197) to (407, 102).
; PLAN: r0=217(x1), r1=197(y1), r2=407(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 197
LDI r2, 407
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
