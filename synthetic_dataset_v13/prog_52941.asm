; DESCRIPTION: Places a blue 25x71 rectangle at position (119, 99).
; PLAN: r0=119(x), r1=99(y), r2=25(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 99
LDI r2, 25
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
