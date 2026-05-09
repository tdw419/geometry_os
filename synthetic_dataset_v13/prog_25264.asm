; DESCRIPTION: Places a orange 107x72 rectangle at position (382, 42).
; PLAN: r0=382(x), r1=42(y), r2=107(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 42
LDI r2, 107
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
