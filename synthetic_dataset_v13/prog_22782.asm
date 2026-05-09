; DESCRIPTION: Draws a magenta line from (264, 137) to (291, 200).
; PLAN: r0=264(x1), r1=137(y1), r2=291(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 137
LDI r2, 291
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
