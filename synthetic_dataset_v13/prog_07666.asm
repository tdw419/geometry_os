; DESCRIPTION: Places a magenta 25x53 rectangle at position (101, 95).
; PLAN: r0=101(x), r1=95(y), r2=25(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 95
LDI r2, 25
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
