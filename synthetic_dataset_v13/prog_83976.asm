; DESCRIPTION: Places a magenta 24x96 rectangle at position (167, 131).
; PLAN: r0=167(x), r1=131(y), r2=24(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 131
LDI r2, 24
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
