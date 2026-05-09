; DESCRIPTION: Places a purple 27x86 rectangle at position (224, 64).
; PLAN: r0=224(x), r1=64(y), r2=27(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 64
LDI r2, 27
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
