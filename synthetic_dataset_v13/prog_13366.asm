; DESCRIPTION: Places a orange 36x64 rectangle at position (42, 122).
; PLAN: r0=42(x), r1=122(y), r2=36(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 122
LDI r2, 36
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
