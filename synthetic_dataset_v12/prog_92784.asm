; DESCRIPTION: Draws a magenta line from (217, 190) to (291, 223).
; PLAN: r0=217(x1), r1=190(y1), r2=291(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 190
LDI r2, 291
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
