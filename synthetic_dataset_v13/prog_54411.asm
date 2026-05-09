; DESCRIPTION: Places a magenta 63x106 rectangle at position (433, 117).
; PLAN: r0=433(x), r1=117(y), r2=63(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 117
LDI r2, 63
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
