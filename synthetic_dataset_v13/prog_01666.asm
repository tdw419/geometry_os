; DESCRIPTION: Draws a magenta line from (164, 144) to (265, 233).
; PLAN: r0=164(x1), r1=144(y1), r2=265(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 144
LDI r2, 265
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
