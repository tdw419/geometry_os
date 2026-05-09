; DESCRIPTION: Places a blue 29x15 rectangle at position (167, 11).
; PLAN: r0=167(x), r1=11(y), r2=29(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 11
LDI r2, 29
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
