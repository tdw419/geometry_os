; DESCRIPTION: Draws a magenta line from (434, 190) to (416, 3).
; PLAN: r0=434(x1), r1=190(y1), r2=416(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 190
LDI r2, 416
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
