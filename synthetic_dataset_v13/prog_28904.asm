; DESCRIPTION: Places a blue 101x41 rectangle at position (224, 20).
; PLAN: r0=224(x), r1=20(y), r2=101(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 20
LDI r2, 101
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
