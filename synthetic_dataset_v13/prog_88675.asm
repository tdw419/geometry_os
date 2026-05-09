; DESCRIPTION: Draws a magenta line from (335, 20) to (72, 27).
; PLAN: r0=335(x1), r1=20(y1), r2=72(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 20
LDI r2, 72
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
