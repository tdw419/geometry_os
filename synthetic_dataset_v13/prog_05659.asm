; DESCRIPTION: Draws a magenta line from (255, 2) to (170, 233).
; PLAN: r0=255(x1), r1=2(y1), r2=170(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 2
LDI r2, 170
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
