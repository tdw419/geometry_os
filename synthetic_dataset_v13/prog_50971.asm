; DESCRIPTION: Places a magenta line segment connecting (444, 5) to (213, 159).
; PLAN: r0=444(x1), r1=5(y1), r2=213(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 5
LDI r2, 213
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
