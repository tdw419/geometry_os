; DESCRIPTION: Draws a magenta line from (417, 205) to (19, 99).
; PLAN: r0=417(x1), r1=205(y1), r2=19(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 205
LDI r2, 19
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
