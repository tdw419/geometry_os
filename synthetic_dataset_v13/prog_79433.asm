; DESCRIPTION: Places a magenta 19x87 rectangle at position (263, 130).
; PLAN: r0=263(x), r1=130(y), r2=19(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 130
LDI r2, 19
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
