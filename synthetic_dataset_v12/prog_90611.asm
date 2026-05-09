; DESCRIPTION: Places a magenta 66x117 rectangle at position (147, 25).
; PLAN: r0=147(x), r1=25(y), r2=66(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 25
LDI r2, 66
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
