; DESCRIPTION: Draws a magenta line from (276, 124) to (207, 169).
; PLAN: r0=276(x1), r1=124(y1), r2=207(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 124
LDI r2, 207
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
