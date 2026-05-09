; DESCRIPTION: Places a blue 43x42 rectangle at position (159, 126).
; PLAN: r0=159(x), r1=126(y), r2=43(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 126
LDI r2, 43
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
