; DESCRIPTION: Draws a magenta line from (165, 206) to (402, 32).
; PLAN: r0=165(x1), r1=206(y1), r2=402(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 206
LDI r2, 402
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
