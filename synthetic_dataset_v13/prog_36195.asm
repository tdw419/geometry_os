; DESCRIPTION: Places a magenta 53x10 rectangle at position (71, 16).
; PLAN: r0=71(x), r1=16(y), r2=53(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 16
LDI r2, 53
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
