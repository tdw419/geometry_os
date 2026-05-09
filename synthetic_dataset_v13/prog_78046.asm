; DESCRIPTION: Places a blue 20x88 rectangle at position (488, 48).
; PLAN: r0=488(x), r1=48(y), r2=20(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 48
LDI r2, 20
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
