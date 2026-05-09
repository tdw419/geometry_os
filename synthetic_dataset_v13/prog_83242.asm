; DESCRIPTION: Places a cyan 17x41 rectangle at position (224, 63).
; PLAN: r0=224(x), r1=63(y), r2=17(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 63
LDI r2, 17
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
