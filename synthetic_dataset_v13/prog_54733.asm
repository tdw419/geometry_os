; DESCRIPTION: Places a blue 19x13 rectangle at position (175, 230).
; PLAN: r0=175(x), r1=230(y), r2=19(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 230
LDI r2, 19
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
