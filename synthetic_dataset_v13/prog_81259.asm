; DESCRIPTION: Places a yellow 40x10 rectangle at position (224, 64).
; PLAN: r0=224(x), r1=64(y), r2=40(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 64
LDI r2, 40
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
