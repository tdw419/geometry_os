; DESCRIPTION: Draws a magenta line from (217, 213) to (177, 233).
; PLAN: r0=217(x1), r1=213(y1), r2=177(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 213
LDI r2, 177
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
