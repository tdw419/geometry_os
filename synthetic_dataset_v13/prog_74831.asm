; DESCRIPTION: Places a blue 26x11 rectangle at position (204, 194).
; PLAN: r0=204(x), r1=194(y), r2=26(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 194
LDI r2, 26
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
