; DESCRIPTION: Draws a magenta line from (59, 252) to (5, 16).
; PLAN: r0=59(x1), r1=252(y1), r2=5(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 252
LDI r2, 5
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
