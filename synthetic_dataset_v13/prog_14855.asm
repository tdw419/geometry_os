; DESCRIPTION: Places a blue 36x83 rectangle at position (35, 88).
; PLAN: r0=35(x), r1=88(y), r2=36(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 88
LDI r2, 36
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
