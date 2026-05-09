; DESCRIPTION: Draws a magenta line from (279, 91) to (328, 107).
; PLAN: r0=279(x1), r1=91(y1), r2=328(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 91
LDI r2, 328
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
