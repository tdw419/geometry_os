; DESCRIPTION: Places a magenta 60x63 rectangle at position (334, 56).
; PLAN: r0=334(x), r1=56(y), r2=60(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 56
LDI r2, 60
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
