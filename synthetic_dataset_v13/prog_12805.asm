; DESCRIPTION: Places a blue 76x12 rectangle at position (17, 100).
; PLAN: r0=17(x), r1=100(y), r2=76(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 100
LDI r2, 76
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
