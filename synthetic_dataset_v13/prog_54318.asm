; DESCRIPTION: Draws a magenta line from (312, 116) to (110, 19).
; PLAN: r0=312(x1), r1=116(y1), r2=110(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 116
LDI r2, 110
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
