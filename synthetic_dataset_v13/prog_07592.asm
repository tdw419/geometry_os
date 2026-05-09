; DESCRIPTION: Draws a magenta line from (407, 69) to (55, 52).
; PLAN: r0=407(x1), r1=69(y1), r2=55(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 69
LDI r2, 55
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
