; DESCRIPTION: Places a magenta 109x89 rectangle at position (362, 56).
; PLAN: r0=362(x), r1=56(y), r2=109(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 56
LDI r2, 109
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
