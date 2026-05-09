; DESCRIPTION: Draws a magenta line from (510, 206) to (453, 249).
; PLAN: r0=510(x1), r1=206(y1), r2=453(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 206
LDI r2, 453
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
