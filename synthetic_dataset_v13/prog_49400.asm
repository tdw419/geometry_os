; DESCRIPTION: Places a magenta 32x40 rectangle at position (426, 206).
; PLAN: r0=426(x), r1=206(y), r2=32(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 206
LDI r2, 32
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
