; DESCRIPTION: Places a magenta 40x64 rectangle at position (307, 32).
; PLAN: r0=307(x), r1=32(y), r2=40(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 32
LDI r2, 40
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
