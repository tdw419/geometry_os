; DESCRIPTION: Places a blue 26x101 rectangle at position (136, 82).
; PLAN: r0=136(x), r1=82(y), r2=26(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 82
LDI r2, 26
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
