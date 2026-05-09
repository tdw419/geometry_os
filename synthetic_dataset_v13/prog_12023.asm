; DESCRIPTION: Places a green 114x21 rectangle at position (224, 36).
; PLAN: r0=224(x), r1=36(y), r2=114(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 36
LDI r2, 114
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
