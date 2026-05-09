; DESCRIPTION: Draws a magenta line from (183, 45) to (109, 187).
; PLAN: r0=183(x1), r1=45(y1), r2=109(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 45
LDI r2, 109
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
