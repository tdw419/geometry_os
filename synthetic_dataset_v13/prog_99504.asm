; DESCRIPTION: Places a blue 25x13 rectangle at position (274, 135).
; PLAN: r0=274(x), r1=135(y), r2=25(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 135
LDI r2, 25
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
