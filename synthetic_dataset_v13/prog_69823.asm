; DESCRIPTION: Places a magenta 35x13 rectangle at position (384, 2).
; PLAN: r0=384(x), r1=2(y), r2=35(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 2
LDI r2, 35
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
