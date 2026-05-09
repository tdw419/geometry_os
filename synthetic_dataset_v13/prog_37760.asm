; DESCRIPTION: Places a blue 107x15 rectangle at position (30, 17).
; PLAN: r0=30(x), r1=17(y), r2=107(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 17
LDI r2, 107
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
