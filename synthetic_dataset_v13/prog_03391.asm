; DESCRIPTION: Places a magenta 32x120 rectangle at position (393, 101).
; PLAN: r0=393(x), r1=101(y), r2=32(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 101
LDI r2, 32
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
