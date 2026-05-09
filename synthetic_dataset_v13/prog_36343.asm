; DESCRIPTION: Draws a magenta line from (370, 235) to (234, 201).
; PLAN: r0=370(x1), r1=235(y1), r2=234(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 235
LDI r2, 234
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
