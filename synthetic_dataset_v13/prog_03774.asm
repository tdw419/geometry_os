; DESCRIPTION: Draws a magenta line from (123, 12) to (371, 255).
; PLAN: r0=123(x1), r1=12(y1), r2=371(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 12
LDI r2, 371
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
