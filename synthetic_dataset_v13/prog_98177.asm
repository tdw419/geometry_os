; DESCRIPTION: Places a magenta line segment connecting (167, 42) to (366, 18).
; PLAN: r0=167(x1), r1=42(y1), r2=366(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 42
LDI r2, 366
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
