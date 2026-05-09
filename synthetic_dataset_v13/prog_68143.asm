; DESCRIPTION: Draws a magenta line from (15, 63) to (48, 229).
; PLAN: r0=15(x1), r1=63(y1), r2=48(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 63
LDI r2, 48
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
