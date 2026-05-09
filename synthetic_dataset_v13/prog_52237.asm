; DESCRIPTION: Places a blue 28x88 rectangle at position (399, 6).
; PLAN: r0=399(x), r1=6(y), r2=28(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 6
LDI r2, 28
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
