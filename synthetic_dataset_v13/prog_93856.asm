; DESCRIPTION: Draws a magenta line from (274, 29) to (437, 234).
; PLAN: r0=274(x1), r1=29(y1), r2=437(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 29
LDI r2, 437
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
