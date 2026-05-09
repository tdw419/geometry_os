; DESCRIPTION: Places a blue 94x42 rectangle at position (196, 178).
; PLAN: r0=196(x), r1=178(y), r2=94(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 178
LDI r2, 94
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
