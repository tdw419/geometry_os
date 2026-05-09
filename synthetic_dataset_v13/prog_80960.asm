; DESCRIPTION: Places a white 42x78 rectangle at position (193, 28).
; PLAN: r0=193(x), r1=28(y), r2=42(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 28
LDI r2, 42
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
