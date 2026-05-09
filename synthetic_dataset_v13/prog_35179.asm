; DESCRIPTION: Draws a magenta line from (370, 54) to (287, 12).
; PLAN: r0=370(x1), r1=54(y1), r2=287(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 54
LDI r2, 287
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
