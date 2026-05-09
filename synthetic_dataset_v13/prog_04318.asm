; DESCRIPTION: Draws a magenta line from (470, 8) to (468, 34).
; PLAN: r0=470(x1), r1=8(y1), r2=468(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 8
LDI r2, 468
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
