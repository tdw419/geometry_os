; DESCRIPTION: Places a white 42x45 rectangle at position (364, 163).
; PLAN: r0=364(x), r1=163(y), r2=42(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 163
LDI r2, 42
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
