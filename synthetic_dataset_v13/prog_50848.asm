; DESCRIPTION: Places a magenta 63x71 rectangle at position (304, 127).
; PLAN: r0=304(x), r1=127(y), r2=63(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 127
LDI r2, 63
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
