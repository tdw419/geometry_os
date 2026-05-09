; DESCRIPTION: Places a blue 30x28 rectangle at position (463, 126).
; PLAN: r0=463(x), r1=126(y), r2=30(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 126
LDI r2, 30
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
