; DESCRIPTION: Places a blue 78x83 rectangle at position (387, 42).
; PLAN: r0=387(x), r1=42(y), r2=78(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 42
LDI r2, 78
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
