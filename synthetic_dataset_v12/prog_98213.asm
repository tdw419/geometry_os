; DESCRIPTION: Places a magenta line segment connecting (263, 32) to (354, 10).
; PLAN: r0=263(x1), r1=32(y1), r2=354(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 32
LDI r2, 354
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
