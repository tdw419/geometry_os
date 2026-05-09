; DESCRIPTION: Draws a magenta line from (229, 18) to (17, 176).
; PLAN: r0=229(x1), r1=18(y1), r2=17(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 18
LDI r2, 17
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
