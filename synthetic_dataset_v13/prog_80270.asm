; DESCRIPTION: Draws a magenta line from (205, 122) to (290, 78).
; PLAN: r0=205(x1), r1=122(y1), r2=290(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 122
LDI r2, 290
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
