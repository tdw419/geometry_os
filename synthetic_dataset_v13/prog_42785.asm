; DESCRIPTION: Renders a magenta box of size 32x36 starting at (197, 151).
; PLAN: r0=197(x), r1=151(y), r2=32(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 151
LDI r2, 32
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
