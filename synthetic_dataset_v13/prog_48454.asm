; DESCRIPTION: Places a blue 86x49 rectangle at position (138, 127).
; PLAN: r0=138(x), r1=127(y), r2=86(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 127
LDI r2, 86
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
