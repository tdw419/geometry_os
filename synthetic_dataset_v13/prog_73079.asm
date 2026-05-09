; DESCRIPTION: Draws a magenta line from (434, 86) to (371, 4).
; PLAN: r0=434(x1), r1=86(y1), r2=371(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 86
LDI r2, 371
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
