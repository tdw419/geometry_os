; DESCRIPTION: Places a magenta 86x66 rectangle at position (384, 28).
; PLAN: r0=384(x), r1=28(y), r2=86(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 28
LDI r2, 86
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
