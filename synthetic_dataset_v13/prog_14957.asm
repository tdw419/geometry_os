; DESCRIPTION: Draws a magenta line from (285, 7) to (189, 233).
; PLAN: r0=285(x1), r1=7(y1), r2=189(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 7
LDI r2, 189
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
