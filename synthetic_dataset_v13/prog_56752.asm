; DESCRIPTION: Draws a magenta line from (315, 66) to (361, 236).
; PLAN: r0=315(x1), r1=66(y1), r2=361(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 66
LDI r2, 361
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
