; DESCRIPTION: Places a blue 24x17 rectangle at position (407, 53).
; PLAN: r0=407(x), r1=53(y), r2=24(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 53
LDI r2, 24
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
