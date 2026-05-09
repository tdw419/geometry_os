; DESCRIPTION: Places a white 42x82 rectangle at position (37, 99).
; PLAN: r0=37(x), r1=99(y), r2=42(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 99
LDI r2, 42
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
