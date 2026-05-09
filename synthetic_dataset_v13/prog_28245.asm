; DESCRIPTION: Places a blue 75x95 rectangle at position (310, 126).
; PLAN: r0=310(x), r1=126(y), r2=75(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 126
LDI r2, 75
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
