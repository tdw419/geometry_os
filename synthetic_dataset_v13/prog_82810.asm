; DESCRIPTION: Places a magenta 70x101 rectangle at position (215, 100).
; PLAN: r0=215(x), r1=100(y), r2=70(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 100
LDI r2, 70
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
