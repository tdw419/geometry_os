; DESCRIPTION: Places a blue 66x30 rectangle at position (90, 165).
; PLAN: r0=90(x), r1=165(y), r2=66(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 165
LDI r2, 66
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
