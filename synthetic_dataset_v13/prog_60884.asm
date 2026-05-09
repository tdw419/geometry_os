; DESCRIPTION: Draws a magenta line from (221, 45) to (423, 192).
; PLAN: r0=221(x1), r1=45(y1), r2=423(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 45
LDI r2, 423
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
