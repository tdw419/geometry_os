; DESCRIPTION: Draws a magenta line from (154, 45) to (85, 107).
; PLAN: r0=154(x1), r1=45(y1), r2=85(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 45
LDI r2, 85
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
