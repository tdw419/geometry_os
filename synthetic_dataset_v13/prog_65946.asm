; DESCRIPTION: Places a magenta 30x42 rectangle at position (383, 144).
; PLAN: r0=383(x), r1=144(y), r2=30(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 144
LDI r2, 30
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
