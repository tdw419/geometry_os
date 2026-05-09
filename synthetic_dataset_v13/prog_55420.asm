; DESCRIPTION: Places a magenta 71x39 rectangle at position (224, 70).
; PLAN: r0=224(x), r1=70(y), r2=71(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 70
LDI r2, 71
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
