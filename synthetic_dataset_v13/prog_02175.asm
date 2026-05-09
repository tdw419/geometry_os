; DESCRIPTION: Draws a magenta line from (116, 73) to (35, 179).
; PLAN: r0=116(x1), r1=73(y1), r2=35(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 73
LDI r2, 35
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
