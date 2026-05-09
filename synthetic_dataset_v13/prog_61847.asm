; DESCRIPTION: Draws a magenta line from (217, 162) to (186, 90).
; PLAN: r0=217(x1), r1=162(y1), r2=186(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 162
LDI r2, 186
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
