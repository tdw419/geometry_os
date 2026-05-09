; DESCRIPTION: Places a magenta line segment connecting (134, 228) to (87, 54).
; PLAN: r0=134(x1), r1=228(y1), r2=87(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 228
LDI r2, 87
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
