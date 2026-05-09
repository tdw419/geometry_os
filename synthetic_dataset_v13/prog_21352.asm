; DESCRIPTION: Places a blue 42x11 rectangle at position (193, 74).
; PLAN: r0=193(x), r1=74(y), r2=42(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 74
LDI r2, 42
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
