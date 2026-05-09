; DESCRIPTION: Places a purple 10x19 rectangle at position (84, 224).
; PLAN: r0=84(x), r1=224(y), r2=10(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 224
LDI r2, 10
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
