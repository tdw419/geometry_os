; DESCRIPTION: Places a white 58x101 rectangle at position (224, 72).
; PLAN: r0=224(x), r1=72(y), r2=58(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 72
LDI r2, 58
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
