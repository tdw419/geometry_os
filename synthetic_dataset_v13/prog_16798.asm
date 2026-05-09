; DESCRIPTION: Places a white 84x16 rectangle at position (268, 42).
; PLAN: r0=268(x), r1=42(y), r2=84(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 42
LDI r2, 84
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
