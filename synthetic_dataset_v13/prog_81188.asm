; DESCRIPTION: Places a blue 69x18 rectangle at position (421, 137).
; PLAN: r0=421(x), r1=137(y), r2=69(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 137
LDI r2, 69
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
