; DESCRIPTION: Places a blue 108x24 rectangle at position (329, 12).
; PLAN: r0=329(x), r1=12(y), r2=108(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 12
LDI r2, 108
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
