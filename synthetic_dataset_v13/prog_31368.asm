; DESCRIPTION: Places a magenta 66x24 rectangle at position (143, 19).
; PLAN: r0=143(x), r1=19(y), r2=66(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 19
LDI r2, 66
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
