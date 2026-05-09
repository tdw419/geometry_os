; DESCRIPTION: Places a magenta 29x24 rectangle at position (196, 5).
; PLAN: r0=196(x), r1=5(y), r2=29(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 5
LDI r2, 29
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
