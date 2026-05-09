; DESCRIPTION: Draws a magenta line from (183, 152) to (258, 162).
; PLAN: r0=183(x1), r1=152(y1), r2=258(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 152
LDI r2, 258
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
