; DESCRIPTION: Draws a magenta line from (132, 91) to (384, 98).
; PLAN: r0=132(x1), r1=91(y1), r2=384(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 91
LDI r2, 384
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
