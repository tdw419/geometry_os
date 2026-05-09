; DESCRIPTION: Places a blue 114x48 rectangle at position (192, 126).
; PLAN: r0=192(x), r1=126(y), r2=114(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 126
LDI r2, 114
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
