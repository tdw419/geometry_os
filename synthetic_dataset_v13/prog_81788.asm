; DESCRIPTION: Draws a magenta line from (467, 8) to (10, 107).
; PLAN: r0=467(x1), r1=8(y1), r2=10(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 8
LDI r2, 10
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
