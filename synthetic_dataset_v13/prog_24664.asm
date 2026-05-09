; DESCRIPTION: Draws a magenta line from (116, 172) to (3, 192).
; PLAN: r0=116(x1), r1=172(y1), r2=3(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 172
LDI r2, 3
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
