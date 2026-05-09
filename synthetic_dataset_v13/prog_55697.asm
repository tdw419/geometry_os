; DESCRIPTION: Places a magenta line segment connecting (332, 114) to (81, 42).
; PLAN: r0=332(x1), r1=114(y1), r2=81(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 114
LDI r2, 81
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
