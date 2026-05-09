; DESCRIPTION: Draws a magenta line from (234, 110) to (260, 210).
; PLAN: r0=234(x1), r1=110(y1), r2=260(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 110
LDI r2, 260
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
