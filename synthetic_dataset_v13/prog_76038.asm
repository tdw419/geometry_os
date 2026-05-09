; DESCRIPTION: Places a blue 26x43 rectangle at position (209, 191).
; PLAN: r0=209(x), r1=191(y), r2=26(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 191
LDI r2, 26
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
