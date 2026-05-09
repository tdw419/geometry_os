; DESCRIPTION: Draws a magenta line from (375, 207) to (156, 30).
; PLAN: r0=375(x1), r1=207(y1), r2=156(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 207
LDI r2, 156
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
