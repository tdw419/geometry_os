; DESCRIPTION: Places a blue 49x111 rectangle at position (307, 64).
; PLAN: r0=307(x), r1=64(y), r2=49(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 64
LDI r2, 49
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
