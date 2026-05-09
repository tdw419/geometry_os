; DESCRIPTION: Draws a magenta line from (220, 141) to (468, 15).
; PLAN: r0=220(x1), r1=141(y1), r2=468(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 141
LDI r2, 468
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
