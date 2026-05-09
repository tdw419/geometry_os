; DESCRIPTION: Places a blue 11x17 rectangle at position (254, 167).
; PLAN: r0=254(x), r1=167(y), r2=11(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 167
LDI r2, 11
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
