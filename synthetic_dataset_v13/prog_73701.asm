; DESCRIPTION: Places a magenta 27x32 rectangle at position (346, 216).
; PLAN: r0=346(x), r1=216(y), r2=27(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 216
LDI r2, 27
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
