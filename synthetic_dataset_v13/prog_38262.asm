; DESCRIPTION: Draws a magenta line from (283, 214) to (25, 167).
; PLAN: r0=283(x1), r1=214(y1), r2=25(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 214
LDI r2, 25
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
