; DESCRIPTION: Places a blue 85x15 rectangle at position (194, 197).
; PLAN: r0=194(x), r1=197(y), r2=85(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 197
LDI r2, 85
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
