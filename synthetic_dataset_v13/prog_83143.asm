; DESCRIPTION: Draws a magenta line from (200, 252) to (410, 78).
; PLAN: r0=200(x1), r1=252(y1), r2=410(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 252
LDI r2, 410
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
