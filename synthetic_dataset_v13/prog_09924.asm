; DESCRIPTION: Places a white 49x36 rectangle at position (361, 42).
; PLAN: r0=361(x), r1=42(y), r2=49(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 42
LDI r2, 49
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
