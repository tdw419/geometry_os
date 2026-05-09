; DESCRIPTION: Places a blue 62x74 rectangle at position (216, 20).
; PLAN: r0=216(x), r1=20(y), r2=62(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 20
LDI r2, 62
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
