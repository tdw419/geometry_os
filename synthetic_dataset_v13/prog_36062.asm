; DESCRIPTION: Places a magenta 54x66 rectangle at position (224, 31).
; PLAN: r0=224(x), r1=31(y), r2=54(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 31
LDI r2, 54
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
