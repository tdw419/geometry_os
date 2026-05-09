; DESCRIPTION: Places a blue 66x117 rectangle at position (310, 15).
; PLAN: r0=310(x), r1=15(y), r2=66(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 15
LDI r2, 66
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
