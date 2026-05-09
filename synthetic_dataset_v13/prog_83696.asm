; DESCRIPTION: Places a blue 12x43 rectangle at position (209, 115).
; PLAN: r0=209(x), r1=115(y), r2=12(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 115
LDI r2, 12
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
