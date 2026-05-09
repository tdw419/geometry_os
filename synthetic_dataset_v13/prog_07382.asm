; DESCRIPTION: Draws a magenta line from (477, 81) to (174, 192).
; PLAN: r0=477(x1), r1=81(y1), r2=174(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 81
LDI r2, 174
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
