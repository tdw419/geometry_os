; DESCRIPTION: Draws a blue line from (290, 134) to (381, 44).
; PLAN: r0=290(x1), r1=134(y1), r2=381(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 134
LDI r2, 381
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
