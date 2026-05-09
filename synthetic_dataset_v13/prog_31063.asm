; DESCRIPTION: Places a magenta line segment connecting (408, 42) to (240, 2).
; PLAN: r0=408(x1), r1=42(y1), r2=240(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 42
LDI r2, 240
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
