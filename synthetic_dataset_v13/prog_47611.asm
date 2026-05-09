; DESCRIPTION: Places a magenta 61x42 rectangle at position (224, 86).
; PLAN: r0=224(x), r1=86(y), r2=61(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 86
LDI r2, 61
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
