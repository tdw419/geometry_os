; DESCRIPTION: Places a magenta 57x10 rectangle at position (383, 173).
; PLAN: r0=383(x), r1=173(y), r2=57(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 173
LDI r2, 57
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
