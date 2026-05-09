; DESCRIPTION: Draws a magenta line from (130, 240) to (307, 9).
; PLAN: r0=130(x1), r1=240(y1), r2=307(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 240
LDI r2, 307
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
