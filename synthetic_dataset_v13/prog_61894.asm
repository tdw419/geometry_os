; DESCRIPTION: Draws a magenta line from (480, 13) to (359, 157).
; PLAN: r0=480(x1), r1=13(y1), r2=359(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 13
LDI r2, 359
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
