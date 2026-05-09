; DESCRIPTION: Draws a magenta line from (137, 254) to (275, 52).
; PLAN: r0=137(x1), r1=254(y1), r2=275(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 254
LDI r2, 275
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
