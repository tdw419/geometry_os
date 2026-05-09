; DESCRIPTION: Places a magenta 18x16 rectangle at position (490, 0).
; PLAN: r0=490(x), r1=0(y), r2=18(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 0
LDI r2, 18
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
