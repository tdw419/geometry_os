; DESCRIPTION: Draws a magenta line from (117, 55) to (258, 25).
; PLAN: r0=117(x1), r1=55(y1), r2=258(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 55
LDI r2, 258
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
