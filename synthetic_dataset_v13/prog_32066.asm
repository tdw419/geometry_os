; DESCRIPTION: Places a white 42x84 rectangle at position (379, 57).
; PLAN: r0=379(x), r1=57(y), r2=42(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 57
LDI r2, 42
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
