; DESCRIPTION: Places a blue 120x81 rectangle at position (53, 108).
; PLAN: r0=53(x), r1=108(y), r2=120(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 108
LDI r2, 120
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
