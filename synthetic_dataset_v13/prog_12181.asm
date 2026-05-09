; DESCRIPTION: Places a magenta 86x12 rectangle at position (176, 102).
; PLAN: r0=176(x), r1=102(y), r2=86(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 102
LDI r2, 86
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
