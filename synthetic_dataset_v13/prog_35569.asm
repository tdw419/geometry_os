; DESCRIPTION: Places a magenta 64x111 rectangle at position (35, 134).
; PLAN: r0=35(x), r1=134(y), r2=64(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 134
LDI r2, 64
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
