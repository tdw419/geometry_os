; DESCRIPTION: Draws a magenta line from (172, 110) to (7, 126).
; PLAN: r0=172(x1), r1=110(y1), r2=7(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 110
LDI r2, 7
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
