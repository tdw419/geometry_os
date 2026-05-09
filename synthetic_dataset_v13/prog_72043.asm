; DESCRIPTION: Places a blue 81x108 rectangle at position (399, 134).
; PLAN: r0=399(x), r1=134(y), r2=81(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 134
LDI r2, 81
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
