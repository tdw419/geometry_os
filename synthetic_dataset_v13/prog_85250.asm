; DESCRIPTION: Draws a magenta line from (248, 183) to (7, 46).
; PLAN: r0=248(x1), r1=183(y1), r2=7(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 183
LDI r2, 7
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
