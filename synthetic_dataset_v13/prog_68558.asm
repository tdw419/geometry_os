; DESCRIPTION: Places a blue 63x40 rectangle at position (54, 42).
; PLAN: r0=54(x), r1=42(y), r2=63(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 42
LDI r2, 63
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
