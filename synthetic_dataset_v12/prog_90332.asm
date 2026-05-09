; DESCRIPTION: Places a magenta line segment connecting (310, 7) to (255, 42).
; PLAN: r0=310(x1), r1=7(y1), r2=255(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 7
LDI r2, 255
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
