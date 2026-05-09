; DESCRIPTION: Places a magenta 29x40 rectangle at position (263, 172).
; PLAN: r0=263(x), r1=172(y), r2=29(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 172
LDI r2, 29
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
