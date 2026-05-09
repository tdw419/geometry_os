; DESCRIPTION: Places a magenta 42x72 rectangle at position (35, 137).
; PLAN: r0=35(x), r1=137(y), r2=42(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 137
LDI r2, 42
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
