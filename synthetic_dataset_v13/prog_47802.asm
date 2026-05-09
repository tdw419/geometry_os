; DESCRIPTION: Draws a magenta line from (315, 76) to (33, 174).
; PLAN: r0=315(x1), r1=76(y1), r2=33(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 76
LDI r2, 33
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
