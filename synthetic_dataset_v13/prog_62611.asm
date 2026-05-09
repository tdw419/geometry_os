; DESCRIPTION: Draws a magenta line from (60, 45) to (164, 101).
; PLAN: r0=60(x1), r1=45(y1), r2=164(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 45
LDI r2, 164
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
