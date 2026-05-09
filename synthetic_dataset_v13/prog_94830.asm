; DESCRIPTION: Places a blue 69x28 rectangle at position (374, 157).
; PLAN: r0=374(x), r1=157(y), r2=69(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 157
LDI r2, 69
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
