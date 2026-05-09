; DESCRIPTION: Places a blue 107x30 rectangle at position (252, 203).
; PLAN: r0=252(x), r1=203(y), r2=107(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 203
LDI r2, 107
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
