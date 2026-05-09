; DESCRIPTION: Places a purple 85x40 rectangle at position (224, 108).
; PLAN: r0=224(x), r1=108(y), r2=85(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 108
LDI r2, 85
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
