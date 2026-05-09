; DESCRIPTION: Places a blue 19x114 rectangle at position (250, 139).
; PLAN: r0=250(x), r1=139(y), r2=19(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 139
LDI r2, 19
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
