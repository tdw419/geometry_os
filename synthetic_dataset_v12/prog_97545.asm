; DESCRIPTION: Draws a magenta line from (462, 61) to (165, 192).
; PLAN: r0=462(x1), r1=61(y1), r2=165(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 61
LDI r2, 165
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
