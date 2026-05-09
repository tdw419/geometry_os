; DESCRIPTION: Places a blue 39x83 rectangle at position (310, 118).
; PLAN: r0=310(x), r1=118(y), r2=39(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 118
LDI r2, 39
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
