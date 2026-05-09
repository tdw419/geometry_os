; DESCRIPTION: Draws a magenta line from (432, 188) to (285, 192).
; PLAN: r0=432(x1), r1=188(y1), r2=285(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 188
LDI r2, 285
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
