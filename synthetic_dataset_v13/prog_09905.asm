; DESCRIPTION: Places a magenta line segment connecting (150, 32) to (82, 13).
; PLAN: r0=150(x1), r1=32(y1), r2=82(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 32
LDI r2, 82
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
