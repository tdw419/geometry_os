; DESCRIPTION: Places a black 17x65 rectangle at position (224, 7).
; PLAN: r0=224(x), r1=7(y), r2=17(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 7
LDI r2, 17
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
