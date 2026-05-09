; DESCRIPTION: Draws a magenta line from (400, 3) to (495, 148).
; PLAN: r0=400(x1), r1=3(y1), r2=495(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 3
LDI r2, 495
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
