; DESCRIPTION: Places a magenta line segment connecting (328, 206) to (402, 255).
; PLAN: r0=328(x1), r1=206(y1), r2=402(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 206
LDI r2, 402
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
