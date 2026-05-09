; DESCRIPTION: Renders a black box of size 17x42 starting at (224, 61).
; PLAN: r0=224(x), r1=61(y), r2=17(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 61
LDI r2, 17
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
