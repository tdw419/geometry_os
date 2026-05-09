; DESCRIPTION: Draws a magenta line from (412, 180) to (252, 109).
; PLAN: r0=412(x1), r1=180(y1), r2=252(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 180
LDI r2, 252
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
