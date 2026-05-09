; DESCRIPTION: Draws a magenta line from (350, 16) to (388, 60).
; PLAN: r0=350(x1), r1=16(y1), r2=388(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 16
LDI r2, 388
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
