; DESCRIPTION: Places a blue 42x69 rectangle at position (285, 56).
; PLAN: r0=285(x), r1=56(y), r2=42(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 56
LDI r2, 42
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
