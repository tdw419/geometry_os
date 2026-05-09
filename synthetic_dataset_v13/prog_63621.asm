; DESCRIPTION: Places a magenta 47x79 rectangle at position (147, 54).
; PLAN: r0=147(x), r1=54(y), r2=47(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 54
LDI r2, 47
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
