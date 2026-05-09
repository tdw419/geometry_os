; DESCRIPTION: Draws a magenta line from (482, 95) to (465, 81).
; PLAN: r0=482(x1), r1=95(y1), r2=465(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 95
LDI r2, 465
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
