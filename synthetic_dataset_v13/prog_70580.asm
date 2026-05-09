; DESCRIPTION: Draws a magenta line from (21, 59) to (395, 229).
; PLAN: r0=21(x1), r1=59(y1), r2=395(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 59
LDI r2, 395
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
