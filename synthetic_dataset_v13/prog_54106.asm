; DESCRIPTION: Places a purple 14x55 rectangle at position (224, 33).
; PLAN: r0=224(x), r1=33(y), r2=14(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 33
LDI r2, 14
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
