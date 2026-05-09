; DESCRIPTION: Places a magenta 97x12 rectangle at position (166, 173).
; PLAN: r0=166(x), r1=173(y), r2=97(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 173
LDI r2, 97
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
