; DESCRIPTION: Draws a magenta line from (450, 214) to (448, 205).
; PLAN: r0=450(x1), r1=214(y1), r2=448(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 214
LDI r2, 448
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
