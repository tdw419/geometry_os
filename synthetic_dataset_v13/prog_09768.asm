; DESCRIPTION: Places a blue 112x28 rectangle at position (120, 122).
; PLAN: r0=120(x), r1=122(y), r2=112(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 122
LDI r2, 112
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
