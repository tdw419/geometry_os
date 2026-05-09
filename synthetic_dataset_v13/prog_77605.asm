; DESCRIPTION: Draws a magenta line from (468, 141) to (331, 184).
; PLAN: r0=468(x1), r1=141(y1), r2=331(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 141
LDI r2, 331
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
