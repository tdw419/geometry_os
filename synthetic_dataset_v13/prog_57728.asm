; DESCRIPTION: Places a purple 49x73 rectangle at position (224, 9).
; PLAN: r0=224(x), r1=9(y), r2=49(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 9
LDI r2, 49
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
