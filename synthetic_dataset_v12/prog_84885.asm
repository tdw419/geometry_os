; DESCRIPTION: Places a magenta 86x53 rectangle at position (418, 198).
; PLAN: r0=418(x), r1=198(y), r2=86(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 198
LDI r2, 86
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
