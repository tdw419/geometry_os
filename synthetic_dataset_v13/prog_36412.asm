; DESCRIPTION: Draws a magenta line from (275, 200) to (176, 89).
; PLAN: r0=275(x1), r1=200(y1), r2=176(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 200
LDI r2, 176
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
