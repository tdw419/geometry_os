; DESCRIPTION: Places a magenta 14x32 rectangle at position (26, 134).
; PLAN: r0=26(x), r1=134(y), r2=14(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 134
LDI r2, 14
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
