; DESCRIPTION: Places a blue 102x25 rectangle at position (224, 203).
; PLAN: r0=224(x), r1=203(y), r2=102(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 203
LDI r2, 102
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
