; DESCRIPTION: Places a blue 20x17 rectangle at position (488, 1).
; PLAN: r0=488(x), r1=1(y), r2=20(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 1
LDI r2, 20
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
