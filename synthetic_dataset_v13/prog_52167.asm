; DESCRIPTION: Places a magenta line segment connecting (337, 117) to (444, 171).
; PLAN: r0=337(x1), r1=117(y1), r2=444(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 117
LDI r2, 444
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
