; DESCRIPTION: Places a magenta line segment connecting (434, 85) to (64, 127).
; PLAN: r0=434(x1), r1=85(y1), r2=64(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 85
LDI r2, 64
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
